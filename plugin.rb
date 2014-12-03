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
				"<div class='fb-post' data-href='#{@url}' data-width='640'><div class='fb-xfbml-parse-ignore'>via <a href='#{@url}'>#{@url}</a></div></div>"
			end

			# def to_html
			# 	video_id = @url.match(REGEX)[1]
			# 	#video_src = "https://www.facebook.com/video/embed?video_id=#{video_id}"
			# 	video_src = "https://m.facebook.com/video/video.php?v=#{video_id}"
			# 	"<div class='fb-video'><iframe src='#{video_src}' frameborder='0' allowfullscreen></iframe><p>via <a href='#{@url}'>#{@url}</a></p></div>"
			# end

		end
	end	
end
