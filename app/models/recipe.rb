
class Recipe < ActiveRecord::Base
	has_and_belongs_to_many :paniers
	
	belongs_to :user

	has_many :ingredients
	accepts_nested_attributes_for :ingredients, :reject_if => :all_blank, :allow_destroy => true
end
