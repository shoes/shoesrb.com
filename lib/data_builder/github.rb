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