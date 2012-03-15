class ShoesHomepage < Webmachine::Resource
  def to_html
    File.read("views/index.html")
  end
end
