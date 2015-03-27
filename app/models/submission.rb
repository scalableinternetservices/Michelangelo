class Submission < ActiveRecord::Base
  belongs_to :community
  has_many :comments

  validates :community, presence: true
  validates :title, length: { minimum: 5 }, uniqueness: true
  validates :url, url: true

  has_many :root_comments, ->{ where parent_id: nil}, class_name: 'Comment'
end
