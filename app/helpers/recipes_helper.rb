module RecipesHelper
	include ApplicationHelper

  def remove_empty_quantity
    if !@filtered_params
      @filtered_params = recipe_params
    end
    @ingredients_include = @filtered_params[:ingredients_attributes]
    @filtered_params[:ingredients_attributes].each do |iid, iparams|    
      if iparams[:quantity] == nil || iparams[:quantity].to_f <= 0
        @ingredients_include.delete(iid)
      end
    end
    @filtered_params[:ingredients_attributes] = @ingredients_include
  end

  def remove_duplicate_products
    if !@filtered_params
      @filtered_params = recipe_params
    end
    if @recipe
      @existing_products = @recipe.ingredients.collect{|i| i[:product_id]}
    else
      @existing_products = Array.new
    end
    @ingredients_include = @filtered_params[:ingredients_attributes]
    @filtered_params[:ingredients_attributes].each do |iid, iparams|  
      @pid =  iparams[:product_id].to_i
      if @existing_products.include?(@pid)
        @ingredients_include.delete(iid)
      else
        @existing_products << @pid
      end
    end
    @filtered_params[:ingredients_attributes] = @ingredients_include
  end


end
