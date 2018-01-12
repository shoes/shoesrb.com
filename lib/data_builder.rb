require 'httparty'
require 'dotenv/load'

require './lib/data_builder/github.rb'
require './lib/data_builder/parser.rb'

class DataBuilder
  
  def initialize
    @github = Github.new
    @repos = nil
    @community = {}
  end

  def run
    puts "getting repos"
    get_repos
    
    puts "saving repos"
    save_repos
    
    puts "getting all contributors to:"
    get_contributor_info
    
    puts "building community list"
    build_community_list
    
    puts "calculating total contribtions"
    tally_total_contributions
    
    puts "saving the community!"
    save_community

    puts "done."
  end

  private
  def get_repos
    @repos = Parser.repos(@github.repos)
  end
  
  def save_repos
    File.open('_data/repos.yml', 'w') {|f| f.write @repos.to_yaml } 
  end

  def get_contributor_info
    # get info on contributors to repos by repo
    @repos.each do |repo|
      puts "    #{repo['name']}"
      contributors = @github.contributors(repo['name'])
      contributors.map! do |contributor_hash|
        contribution_data = Parser.contributor(contributor_hash)
        user = @github.user(contributor_hash['login'])
        contribution_data['avatar_url_100'] = "#{user['avatar_url']}&size=100"
        contribution_data.merge! Parser.user(user)
      end
      repo["contributors"] = contributors
    end
  end

  def build_community_list
    # build unique users with zero contribution count
    @repos.each do |repo|
      repo['contributors'].each do |contributor|
        user_id = contributor['id']
        data = contributor.dup
        data = data.tap{|data_hash| data_hash.delete('id')}
        data['contributions'] = 0
        @community[user_id] = data
      end
    end
  end

  def tally_total_contributions
    # loop back through and keep cumulative track of all contributions
    @repos.each do |repo|
      repo['contributors'].each do |contributor|
        user_id = contributor['id']
        contributions = contributor['contributions']
        @community[user_id]['contributions'] += contributions
      end
    end
    @community = @community.sort_by{|_user_id, user_data| user_data['contributions']}.reverse
  end

  def save_community
    File.open('_data/community.yml', 'w') {|f| f.write @community.to_yaml}
  end
end

DataBuilder.new.run