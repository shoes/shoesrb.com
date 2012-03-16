require 'haml'

class Render
  def initialize(view)
    @view = view
  end

  def render(locals={})
    Haml::Engine.new(File.read("views/layout.html.haml")).render do
      Haml::Engine.new(File.read("views/#{@view}.html.haml")).render(Object.new, locals)
    end
  end
end
