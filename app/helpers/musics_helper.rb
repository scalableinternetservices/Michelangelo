module MusicsHelper
	include ActsAsTaggableOn::TagsHelper

	def cache_key_for_music_table(user)
	    "music-table-#{user.id}-#{user.music_lastupdate}"
	end

	def cache_key_for_music_row(music)
	    "music-#{music.id}-#{music.updated_at}-#{music.likecount}-#{music.user.updated_at}"
	end	
end
