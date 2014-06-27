class SiteController < ApplicationController
  def index
  	# retrieve all paniers ordered chronologically
  	@paniers = Panier.order('semaine desc')
  end
end
