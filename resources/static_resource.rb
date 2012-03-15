require 'pathname'

class StaticResource < Webmachine::Resource
  def initialize
    @pathname = Pathname(request.path_info[:root].to_s) + request.disp_path
  end

  def content_types_provided
    [[Rack::Mime.mime_type(@pathname.extname, 'application/octet-stream'), :serve_file]]
  end

  def resource_exists?
    @pathname.file?
  end

  def last_modified
    @pathname.mtime
  end

  def serve_file
    # Note this is probably not a good idea for big files.
    # In the future, WM should be able to stream out IO objects.
    @pathname.read 
  end
end

