# name: Facebook Embed Onebox
# version: 0.1
# authors: Lainfox at www.jumak.net

# Facebook Video | Post.
# from https://www.facebook.com/video.php?v=318742168310835
# to https://www.facebook.com/video/embed?video_id=318742168310835

class Onebox::Engine::FacebookOnebox
  include Onebox::Engine

  matches_regexp /^https?:\/\/(?:www\.)?(?:m\.)?(?:facebook\.com/video.php?v=).+$/
  #matches_regexp /^https?:\/\/(?:www\.)?(?:m\.)?(?:facebook\.com\/(video.php|permalink.php))\/.+$/

  def video_id
  	#	match = uri.path.match(/\/video.php?v=([^\&]+)/)
		# return match[1] if match && match[1]
  	if params['v']
      return params['v']
    end

    nil
   rescue
   	return nil  	
  end


  def to_html
  	if video_id
      # Avoid making HTTP requests if we are able to get the video ID from the
      # URL.
      html = "<iframe width=\"640\" height=\"360\" src=\"https://www.facebook.com/video/embed?video_id=#{video_id}\" frameborder=\"0\" allowfullscreen></iframe>"
    else
      # for channel pages
      html = Onebox::Engine::WhitelistedGenericOnebox.new(@url, @cache, @timeout).to_html
      return nil unless html
      html = html.gsub /http:/, 'https:'
      html = html.gsub /"\/\//, '"https://'
      html = html.gsub /'\/\//, "'https://"
    end
  end
end