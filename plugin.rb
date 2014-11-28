# name: Facebook Embed Onebox
# version: 0.1
# authors: Lainfox at www.jumak.net

# Facebook Video | Post.
# from https://www.facebook.com/video.php?v=318742168310835
# to https://www.facebook.com/video/embed?video_id=318742168310835
# http://www.jumak.net/onebox?url=https%3A%2F%2Fwww.facebook.com%2Fvideo.php%3Fv%3D304306133101197&refresh=false&_=1417155068364

class Onebox::Engine::FacebookOnebox
  include Onebox::Engine

  REGEX = /^https?:\/\/(?:www\.)?(?:m\.)?(?:facebook\.com\/video.php\?v=)(\d+)\S*$/
  matches_regexp REGEX
  
  def to_html
  	video_id = @url.match(REGEX)[1]
    
    <<HTML
<div class="fb-video">
  <iframe src="https://www.facebook.com/video/embed?video_id=#{video_id}" frameborder="0" allowfullscreen></iframe>
  <p>#{@url}</p>
</div>
HTML
    
   end

end