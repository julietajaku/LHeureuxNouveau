
class Recipe < ActiveRecord::Base

	has_and_belongs_to_many :paniers
	belongs_to :user
end
