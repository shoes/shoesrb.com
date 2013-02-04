class DownloadsPage < Webmachine::Resource
  def to_html
    Template.new(:downloads).render
  end
end
