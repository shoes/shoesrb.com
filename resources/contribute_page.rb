class ContributePage < Webmachine::Resource
  def to_html
    Template.new(:contribute).render
  end
end
