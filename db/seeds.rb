# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
# encoding: utf-8

# User.delete_all
# Music.delete_all
# start = 0

number_of_users = 1000 
number_of_musics = 10
number_of_comments = 5

number_of_users.times do |i|
if User.count < number_of_users
	user = User.create(
	  name: User.count,
	  password: "123",
	  password_confirmation: "123")
	# user.save!

	# if i == 0
	# 	start = user.id
	# 	puts "start id: #{start}"
	# end

	# if i % 10 == 0
	# 	puts "user ", i
	# end
# end

# 100.times do |i|

	# k = start + i
	# k = User.count

	number_of_musics.times do |j|
		music = Music.create(
		  comment: "scaling test",
		  sharetype: 0,
		  uid: user.id,
		  link:   'http://music.163.com/outchain/player?type=2&id=29019227&auto=0&height=66')
		# music.save!

		number_of_comments.times do |m|	
			comment = Comment.create(
			  content: "scaling test scaling test scaling test",
			  commenttype: 0,
			  post_id: music.id,
			  user_id: user.id
			  )
			# comment.save!
			# puts comment.id
		end
	end
	
	number_of_musics.times do |j|
		audio = Audio.create(
		  comment: "audio scaling test",
		  uid: user.id,
		  audioFile_file_name:   'test.m4a',
		  )
		# audio.save!

		number_of_comments.times do |m|	
			comment = Comment.create(
			  content: "scaling test scaling test scaling test",
			  commenttype: 1,
			  post_id: audio.id,
			  user_id: user.id
			  )
			# comment.save!
			# puts comment.id
		end

	end


	if i % 10 == 0
		puts "music for user ", i
	end
end

end

# Music.create!(title: 'See You Again',
#   artist: 'Wiz Khalifa / Charlie Puth',
#   comment: "R.I.P Paul Walker",
#   hashtag: '#Pop #Rap #Furious7',
#   link:   'http://music.163.com/outchain/player?type=2&id=30953009&auto=0&height=66')

# Music.create!(title: 'Rose',
#   artist: 'Olivia Ong',
#   comment: "Calm rainy night. :)",
#   hashtag: '#Country #Guitar',
#   link:   'http://music.163.com/outchain/player?type=2&id=280561&auto=0&height=66')

# Friendship.create!(friender_id: 1,
#   friended_id: 2, accepted: false)

# Friendship.create!(friender_id: 1,
#   friended_id: 3, accepted: false)

# Friendship.create!(friender_id: 1,
#   friended_id: 4, accepted: false)

# Friendship.create!(friender_id: 1,
#   friended_id: 5, accepted: false)

# Friendship.create!(friender_id: 1,
#   friended_id: 6, accepted: false)

# Friendship.create!(friender_id: 2,
#   friended_id: 1, accepted: false)

# Friendship.create!(friender_id: 2,
#   friended_id: 3, accepted: false)

# Friendship.create!(friender_id: 2,
#   friended_id: 4, accepted: false)

# Friendship.create!(friender_id: 2,
#   friended_id: 5, accepted: false)

# Friendship.create!(friender_id: 2,
#   friended_id: 6, accepted: false)


# Friendship.create!(friender_id: 3,
#   friended_id: 1, accepted: false)

# Friendship.create!(friender_id: 3,
#   friended_id: 2, accepted: false)

# Friendship.create!(friender_id: 3,
#   friended_id: 4, accepted: false)

# Friendship.create!(friender_id: 3,
#   friended_id: 5, accepted: false)

# Friendship.create!(friender_id: 3,
#   friended_id: 6, accepted: false)


# Friendship.create!(friender_id: 4,
#   friended_id: 1, accepted: false)

# Friendship.create!(friender_id: 4,
#   friended_id: 2, accepted: false)

# Friendship.create!(friender_id: 4,
#   friended_id: 3, accepted: false)

# Friendship.create!(friender_id: 4,
#   friended_id: 5, accepted: false)

# Friendship.create!(friender_id: 4,
#   friended_id: 6, accepted: false)

# Friendship.create!(friender_id: 5,
#   friended_id: 1, accepted: false)

# Friendship.create!(friender_id: 5,
#   friended_id: 2, accepted: false)

# Friendship.create!(friender_id: 5,
#   friended_id: 3, accepted: false)

# Friendship.create!(friender_id: 5,
#   friended_id: 4, accepted: false)

# Friendship.create!(friender_id: 5,
#   friended_id: 6, accepted: false)

# Friendship.create!(friender_id: 6,
#   friended_id: 1, accepted: false)

# Friendship.create!(friender_id: 6,
#   friended_id: 2, accepted: false)

# Friendship.create!(friender_id: 6,
#   friended_id: 3, accepted: false)

# Friendship.create!(friender_id: 6,
#   friended_id: 4, accepted: false)

# Friendship.create!(friender_id: 6,
#   friended_id: 5, accepted: false)
