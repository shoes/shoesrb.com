class TutorialsPage < Webmachine::Resource
  def to_html
    Template.new(:tutorials).render
  end
end
