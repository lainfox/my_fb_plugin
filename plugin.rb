# name: Facebook Embed Onebox
# version: 0.1
# authors: Lainfox at www.jumak.net

# Facebook Video | Post.
# from https://www.facebook.com/video.php?v=318742168310835
# to https://www.facebook.com/video/embed?video_id=318742168310835
# http://www.jumak.net/onebox?url=https%3A%2F%2Fwww.facebook.com%2Fvideo.php%3Fv%3D304306133101197&refresh=false&_=1417155068364

class Onebox::Engine::FacebookOnebox
  include Onebox::Engine

  matches_regexp /^https?:\/\/(?:www\.)?(?:m\.)?(?:facebook\.com\/video.php\?v\=).+$/
  #matches_regexp /^https?:\/\/(?:www\.)?(?:m\.)?(?:facebook\.com\/(video.php|permalink.php))\/.+$/

  def video_id
    match = uri.path.match(/\/video.php\?v=([^\&]+)/)
    return match[1] if match && match[1]

    nil	
  end


  def to_html
  	if video_id
      "<iframe width=\"640\" height=\"360\" src=\"https://www.facebook.com/video/embed?video_id=#{video_id}\" frameborder=\"0\" allowfullscreen></iframe>"
    else
      #raw[:html] || ""
      "#{@url}<div>cant get video_id</div>"
    end
  end

end