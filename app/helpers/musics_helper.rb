module MusicsHelper
	include ActsAsTaggableOn::TagsHelper
def cache_key_for_music_table
   "music-table-#{Music.maximum(:updated_at)}-#{Comment.maximum(:updated_at)}"
end

def cache_key_for_music_row(music)
    "music-#{music.id}-#{music.updated_at}-#{music.comments.count}"
end
end
