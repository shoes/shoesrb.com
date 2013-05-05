class GetHelpPage < Webmachine::Resource
  def to_html
    Template.new(:get_help).render
  end
end
