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
				"<iframe src='#{video_src}'' width='640' height='360' frameborder='0' allowfullscreen></iframe><p>#{@url}</p>"
			end

		end
	end	
end
