require 'metadown'

class WalkthroughPage < Webmachine::Resource
  def to_html
    walkthrough = Metadown.render(File.read("walkthrough/README.md"))
    Template.new(:walkthrough).render(walkthrough: walkthrough)
  end
end

