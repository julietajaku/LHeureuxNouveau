class Panier < ActiveRecord::Base
	belongs_to :user
	belongs_to :week

	has_and_belongs_to_many :recipes

	# ensure that a user_id is present
	validates :user_id, presence: true

	# ensures a date is present
	validates :week_id, presence: true

end