require 'haml'

class ShoesHomepage < Webmachine::Resource
  def to_html
    Haml::Engine.new(File.read("views/layout.html.haml")).render do
      Haml::Engine.new(File.read("views/index.html.haml")).render
    end
  end
end
