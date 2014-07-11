
class Recipe < ActiveRecord::Base
	has_and_belongs_to_many :paniers
	has_many :ingredients, :dependent => :destroy, autosave: true
	has_many :products, :through => :ingredients

	accepts_nested_attributes_for :ingredients

end