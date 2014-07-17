
class Ingredient < ActiveRecord::Base
	belongs_to :recipe
	belongs_to :product

	validates :product, uniqueness: {scope: :recipe}, presence: true

end
