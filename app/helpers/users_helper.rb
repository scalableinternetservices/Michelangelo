module UsersHelper
def cache_key_for_searchedUser_table
    "searchedUser-table-#{User.maximum(:updated_at)}"
end

def cache_key_for_searchedUser_row(searchedUser)
    "searchedUser-#{searchedUser.id}-#{searchedUser.updated_at}"
end

def cache_key_for_timeline_table
    "music-table-#{Music.maximum(:updated_at)}-#{Comment.maximum(:updated_at)}"
end

def cache_key_for_timeline_row(music)
    "music-#{music.id}-#{music.updated_at}-#{music.comments.count}"
end
end
