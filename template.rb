require 'haml'

class Template
  def initialize(view)
    @view = view
  end

  def render(locals={})
    locals.merge! page: @view
    Haml::Engine.new(File.read("views/layout.html.haml")).render(Object.new, locals) do
      Haml::Engine.new(File.read("views/#{@view}.html.haml")).render(Object.new, locals)
    end
  end
end
