# Manager for downloads hosted elsewhere. Handles redirects from shoesrb.com
# URLs to the URLs where resources actually live.
#
# Request downloads by filename like this:
#
#     GET /downloads/filename.zip HTTP/1.1
#
# Manage redirects to actual resources by adding to the DOWNLOADS hash:
#
#     "filename.zip" => "http://url/for/actual/filename.zip"
#
class DownloadResource < Webmachine::Resource
  DOWNLOADS = {
    "shoes-app-template-0.0.1.zip" => "https://s3.amazonaws.com/net.wasnotrice.shoes/wrappers/shoes-app-template-0.0.1.zip",
    "shoes-3.1.0.run" => "https://github.com/downloads/shoes/shoes/shoes-3.1.0.run",
    "shoes-3.1.0.dmg" => "https://github.com/downloads/shoes/shoes/shoes-3.1.0.dmg",
    "shoes3.exe.zip" => "https://github.com/downloads/shoes/shoes/shoes3.exe.zip",
  }

  # shows up in the URL like so: http://shoesrb.com/downloads/:filename
  def filename
    @request.path_info[:filename]
  end

  def resource_exists?
    false
  end

  def previously_existed?
    DOWNLOADS.has_key?(filename) 
  end

  def moved_permanently?
    previously_existed? && DOWNLOADS[filename]
  end
end
