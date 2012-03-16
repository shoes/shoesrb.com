desc "Make a new post"
task :"new_post", :title do |t, args|
  args.with_defaults(:title => 'new-post')
  title = args.title
  filename = "posts/#{title.downcase.gsub(/\W/, "-")}.md"

  puts "Creating new posts: #{filename}"
  open(filename, 'w') do |post|
    post.puts "---"
    post.puts "title: \"#{title.gsub(/&/,'&amp;')}\""
    post.puts "slug: \"#{title.gsub(/\W/, '-').downcase}\""
    post.puts "date: #{Time.now.strftime('%Y-%m-%d %H:%M')}"
    post.puts "---"
    post.puts ""
    post.puts "CONTENT HERE **IN MARKDOWN**"
  end
end

