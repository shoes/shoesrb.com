require 'httparty'

class Github
  include HTTParty
  base_uri 'https://api.github.com/'

  def initialize
    @auth = {'User-Agent' => 'nicholalexander',
      'Authorization' => 'Bearer xxxxxx'
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

# get org members
github = Github.new
members = Parser.members(github.members)
members.each do |member_hash|
  user = github.user(member_hash['login'])
  member_hash.merge! Parser.user(user)
end
File.open('_data/members.yml', 'w') { |f| f.write members.to_yaml }

# get repos
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
File.open('_data/repo_with_contributors.yml', 'w') {|f| f.write repos.to_yaml}

# build the community data
# (unique contributors who are not org members)
contributors = []
repos.each do |repo|
  repo['contributors'].each do |contributor|
    contributors << contributor
  end
end
contributors = contributors.uniq! {|e| e['login']}
member_logins = members.map {|e| e['login']}
community = contributors.select {|e| !member_logins.include? e['login']}
File.open('_data/community.yml', 'w') {|f| f.write community.to_yaml}
