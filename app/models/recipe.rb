
class Recipe < ActiveRecord::Base
	has_and_belongs_to_many :paniers
	has_and_belongs_to_many :products #,autosave => true?
end