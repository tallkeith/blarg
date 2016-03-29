class Post < ActiveRecord::Base
	validates_presence_of :title
	paginates_per 10
	has_many :comments
end
