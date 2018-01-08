require 'httparty'
require 'dotenv/load'

class Github
  include HTTParty
  base_uri 'https://api.github.com/'

  def initialize
    @auth = {'User-Agent' => 'nicholalexander',
      'Authorization' => "Bearer #{ENV['GITHUB_TOKEN']}"
    }
  end

  def members
    resource = '/orgs/shoes/members'
    response = self.class.get(resource, headers: @auth).parsed_response
  end

  def user(user_name)
    resource = "/users/#{user_name}"
    response = self.class.get(resource, headers: @auth).parsed_response
  end

  def repos
    resource = "/orgs/shoes/repos"
    response = self.class.get(resource, headers: @auth).parsed_response
  end

  def contributors(repo)
    resource = "/repos/shoes/#{repo}/contributors"
    response = self.class.get(resource, headers: @auth).parsed_response
  end
end

class Parser
  REPO_FIELDS = ['name', 'html_url', 'url', 'open_issues_count', 'stargazers_count']
  MEMBER_FIELDS = ['id', 'login', 'url', 'avatar_url']
  USER_FIELDS = ["html_url", "name", "company", "blog", "location", "bio"]
  CONTRIBUTOR_FIELDS = ["id", "login", "url", "avatar_url", "contributions"]
  
  def self.members(data)
    member_data = []
    data.each do |member|
      member_data << member.select { |key, _value| MEMBER_FIELDS.include? key }
    end
    return member_data
  end

  def self.users(data)
    user_data = []
    data.each do |user|
      user_data << user_select(user)
    end
    return user_data
  end

  def self.user(data)
    user_select(data)
  end

  def self.repos(data)
    repo_data = []
    data.each do |repo|
      repo_data << repo.select{ |key, _value| REPO_FIELDS.include? key }
    end
    return repo_data
  end

  def self.contributor(data)
    data.select { |key, value| CONTRIBUTOR_FIELDS.include? key }
  end

  private
  def self.user_select(user_hash)
    user_hash.select{|key, _value| USER_FIELDS.include? key}
  end
end

# get repos
github = Github.new
repos = Parser.repos(github.repos)
File.open('_data/repos.yml', 'w') {|f| f.write repos.to_yaml } 

# get info on contributors to repos
repos.each do |repo|
  contributors = github.contributors(repo['name'])
  contributors.map! do |contributor_hash|
    contribution_data = Parser.contributor(contributor_hash)
    user = github.user(contributor_hash['login'])
    contribution_data.merge! Parser.user(user)
  end
  repo["contributors"] = contributors
end

# build user profile with cumulative 
users = {}
# build unique users with zero contribution count
repos.each do |repo|
  repo['contributors'].each do |contributor|
    user_id = contributor['id']
    data = contributor.dup
    data = data.tap{|contributor_hash| contributor_hash.delete('id')}
    data['contributions'] = 0
    users[user_id] = data
  end
end

repos.each do |repo|
  repo['contributors'].each do |contributor|
    user_id = contributor['id']
    contributions = contributor['contributions']
    users[user_id]['contributions'] += contributions
  end
end
# sort by reverse
users = users.sort_by{|_user_id, user_data| user_data['contributions']}.reverse
File.open('_data/users.yml', 'w') {|f| f.write users.to_yaml}