class SiteController < ApplicationController
  def index
  	# retrieve all paniers ordered chronologically
  	@paniers = Panier.order('semaine desc')
  	@recipes = Recipe.order('title')
  end
end
