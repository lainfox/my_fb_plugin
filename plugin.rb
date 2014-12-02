# name: Facebook Embed Onebox
# version: 0.1
# authors: Lainfox

Onebox = Onebox

module Onebox
	module Engine
		class FacebookVideoOnebox
			include Engine
			REGEX = /^https?:\/\/(?:www\.)?(?:m\.)?(?:facebook\.com\/video.php\?v=)(\d+)\S*$/
			matches_regexp REGEX

			def to_html
				video_id = @url.match(REGEX)[1]
				video_src = "https://www.facebook.com/video/embed?video_id=#{video_id}"
				"<div class='fb-video'><iframe src='#{video_src}'' frameborder='0' allowfullscreen></iframe><p><span class='fb-helper'>클릭하면 플레이.</span><br> via <a href='#{@url}'>#{@url}</a></p></div>"
			end

		end
	end	
end
