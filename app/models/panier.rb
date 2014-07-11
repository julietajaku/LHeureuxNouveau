class Panier < ActiveRecord::Base
	belongs_to :user
	belongs_to :week

	has_and_belongs_to_many :recipes

	# ensure that a user_id is present
	validates_presence_of :user

	# ensures a date is present
	validates_presence_of :week

	validates :week, uniqueness: {scope: :user_id}, presence: true
end