module PaniersHelper
	include RecipesHelper

	def panier_cost(panier)
	  @cost = 0
	  panier.recipes.each do |r|
	  	@cost += recipe_cost(r)
	  end
	  return @cost
	end
end
