require 'rubygems'
require 'bundler/setup'
require 'webmachine'
require 'webmachine/adapters/rack'

Dir["resources/*"].each {|f| require "./#{f}" }

require "./render"

Shoes = Webmachine::Application.new do |app|
  app.routes do
    add [], ShoesHomepage 
    add ["blog"], BlogResource
    add ["blog", :slug], BlogResource
    add ['*'], StaticResource, :root => "public"
  end
  app.configure do |config|
    config.adapter = :Rack
  end
end

run Shoes.adapter
