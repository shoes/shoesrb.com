require 'metadown'

$posts = Dir["posts/*"].collect do |file|
  Metadown.render(File.read(file))
end.sort{|a,b| a.metadata["date"] <=> b.metadata["date"]}.reverse

class BlogResource < Webmachine::Resource  
  def resource_exists?
    return true unless request.path_info[:slug] #index

    @post = $posts.find {|p| p.metadata["slug"] == request.path_info[:slug] }
    !@post.nil?
  end

  def to_html
    if @post
      Template.new(:post).render(
        :contents => @post.output,
        :title => @post.metadata["title"],
        :date => @post.metadata["date"]
      )
    else
      Template.new(:blog).render(:posts => $posts)
    end
  end
end
