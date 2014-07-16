module RecipesHelper
	include ApplicationHelper

  def find_recipes_this_week
     @recipes_missing_ingredients = Recipe.find_by_sql ["SELECT recipes.id 
     								FROM recipes 
     								INNER JOIN ingredients 
     								WHERE recipes.id = ingredients.recipe_id
     								AND ingredients.id IN 
     								(SELECT ingredients.id 
     									 FROM products
     									 INNER JOIN ingredients
     									 WHERE products.id = ingredients.product_id
     									 AND products.available = 'f')"]

	@recipes = Recipe.all - Recipe.find(@recipes_missing_ingredients)
  end
  	
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
