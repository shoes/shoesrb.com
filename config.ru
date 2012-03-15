require 'rubygems'
require 'bundler/setup'
require 'webmachine'
require 'webmachine/adapters/rack'

Dir["resources/*"].each {|f| require "./#{f}" }

Shoes = Webmachine::Application.new do |app|
  app.routes do
    add [], ShoesHomepage 
    add ['*'], StaticResource, :root => "public"
  end
  app.configure do |config|
    config.adapter = :Rack
  end
end

run Shoes.adapter
