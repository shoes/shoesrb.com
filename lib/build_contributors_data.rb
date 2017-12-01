require 'colors'
require 'httparty'

require 'pry'

# build members hash
members = {}

# make call to contributors.
response = HTTParty.get('https://api.github.com/orgs/shoes/members').parsed_response
keys_to_keep = ["id", "login", "url", "avatar_url"]
response.each do |member|
  github_id = member["id"]
  members[github_id] = member.select { |key, _value| keys_to_keep.include? key }
end

keys_to_keep = ["html_url", "name", "company", "blog", "location", "bio"]
members.each do |id, member_data|
  response = HTTParty.get(member_data["url"]).parsed_response
  member_data.merge! response.select { |key, _value| keys_to_keep.include? key }
end

# write to yaml file
File.open('_data/members.yml', 'w') {|f| f.write members.to_yaml } 


# build contributors
contributors = {}
repos = {}

response = HTTParty.get('https://api.github.com/orgs/shoes/repos').parsed_response

keys_to_keep = ['name', 'html_url', 'url', 'open_issues_count', 'stargazers_count']
response.each do |repo|
  binding.pry
  repo_github_id = repo['id']
  repos[repo_github_id] = repo.select { |key, value| keys_to_keep.include? key}
end

File.open('_data/repos.yml', 'w') {|f| f.write repos.to_yaml } 

keys_to_keep = ["id", "login", "url", "avatar_url", "contributions"]
repos.each do |id, repo_data|
  contributors_url = repo_data['url'] + '/contributors'
  response = HTTParty.get(contributors_url).parsed_response
  response.each do |contributor|
    id = contributor["id"]
    contributors[id] = contributor.select {|key, value| keys_to_keep.include? key}
    response = HTTParty.get(contributor["url"]).parsed_response
    personal_keys = ["html_url", "name", "company", "blog", "location", "bio"]
    contributor[id].merge! response.select { |key, value| personal_keys.include? key}
  end 
end

File.open('_data/contributors.yml', 'w') {|f| f.write contributors.to_yaml }