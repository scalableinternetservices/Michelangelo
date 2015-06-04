module AudiosHelper

	def cache_key_for_audio_table(user)
	    "audio-table-#{user.id}-#{user.audio_lastupdate}"
	end

	def cache_key_for_audio_row(audio)
	    "audio-#{audio.id}-#{audio.updated_at}-#{audio.audiolikecount}-#{audio.user.updated_at}"
	end	
end
