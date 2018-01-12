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