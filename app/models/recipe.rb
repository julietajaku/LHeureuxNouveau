
class Recipe < ActiveRecord::Base
	has_and_belongs_to_many :paniers
	belongs_to :user
	has_many :ingredients
	has_many :products, through: :ingredients
	accepts_nested_attributes_for :ingredients, :allow_destroy => true
end
