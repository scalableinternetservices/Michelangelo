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

User.delete_all
Music.delete_all
start = 0
100.times do |i|

	user = User.create(
	  name: "#{i}",
	  password: "123",
	  password_confirmation: "123")
	user.save!

	if i == 0
		start = user.id
		puts "start id: #{start}"
	end

	if i % 10 == 0
		puts "user ", i
	end
end

100.times do |i|

	k = start + i

	100.times do |j|
		music = Music.create(
		  comment: "scaling test",
		  sharetype: 0,
		  uid: k,
		  link:   'http://music.163.com/outchain/player?type=2&id=29019227&auto=0&height=66')
		music.save!

    20.times do |m|
		
		comment = Comment.create(
		  content: "scaling test scaling test scaling test",
		  commenttype: 0,
		  post_id: music.id,
		  user_id: k
		  )
		comment.save!
		# puts comment.id
    end

	end


	if i % 10 == 0
		puts "music for user ", i
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
