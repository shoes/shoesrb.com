class AboutPage < Webmachine::Resource
  def to_html
    Template.new(:about).render
  end
end
