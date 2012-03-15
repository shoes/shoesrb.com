require 'haml'

class ShoesHomepage < Webmachine::Resource
  def to_html
    engine = Haml::Engine.new(File.read("views/index.html.haml"))
    engine.render(Object.new)
  end
end
