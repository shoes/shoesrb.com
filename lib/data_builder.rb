require 'httparty'
require 'dotenv/load'
require 'pry'

require './lib/data_builder/github.rb'
require './lib/data_builder/parser.rb'

class DataBuilder
  
  def initialize
    @github = Github.new
    @repos = nil
    @users = {}
  end

  def run
    get_repos
    save_repos
    get_contributor_info
    build_users_list
    tally_total_contributions
    save_users
  end

  private
  def get_repos
    @repos = Parser.repos(@github.repos)
  end
  
  def save_repos
    File.open('_data/repos.yml', 'w') {|f| f.write @repos.to_yaml } 
  end

  def get_contributor_info
    # get info on contributors to repos
    @repos.each do |repo|
      contributors = @github.contributors(repo['name'])
      contributors.map! do |contributor_hash|
        contribution_data = Parser.contributor(contributor_hash)
        user = @github.user(contributor_hash['login'])
        contribution_data.merge! Parser.user(user)
      end
      repo["contributors"] = contributors
    end
  end

  def build_users_list
    # build unique users with zero contribution count
    @repos.each do |repo|
      repo['contributors'].each do |contributor|
        user_id = contributor['id']
        data = contributor.dup
        data = data.tap{|contributor_hash| contributor_hash.delete('id')}
        data['contributions'] = 0
        @users[user_id] = data
      end
    end
  end

  def tally_total_contributions
    # loop back through and keep cumulative track of all contributions
    @repos.each do |repo|
      repo['contributors'].each do |contributor|
        user_id = contributor['id']
        contributions = contributor['contributions']
        @users[user_id]['contributions'] += contributions
      end
    end
    @users = @users.sort_by{|_user_id, user_data| user_data['contributions']}.reverse
  end

  def save_users
    File.open('_data/users.yml', 'w') {|f| f.write @users.to_yaml}
  end
end

DataBuilder.new.run