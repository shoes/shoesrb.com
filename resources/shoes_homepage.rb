class ShoesHomepage < Webmachine::Resource
  def to_html
    Template.new(:index).render
  end
end
