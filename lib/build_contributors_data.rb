require 'colors'
require 'httparty'

require 'pry'

# build members
members = []

# make call to contributors.
response = HTTParty.get('https://api.github.com/orgs/shoes/members').parsed_response
keys_to_keep = ["login", "url", "avatar_url"]
response.each do |member|
  members << member.select { |key, _value| keys_to_keep.include? key }
end

# write to yaml file
File.open('_data/members.yml', 'w') {|f| f.write members.to_yaml } 

# build contributors
contributors = []
