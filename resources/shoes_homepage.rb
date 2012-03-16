class ShoesHomepage < Webmachine::Resource
  def to_html
    Render.new(:index).render
  end
end
