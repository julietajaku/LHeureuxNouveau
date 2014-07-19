class RecipesController < ApplicationController
  include ApplicationHelper, RecipesHelper

  before_action :set_recipe, only: [:show, :edit, :update, :destroy, :add_to_panier, :remove_from_panier]
  before_action :verify_is_admin, only: [:create, :edit, :update, :destroy]

  before_action :set_panier

  before_action :remove_empty_quantity, only: [:create, :update]
  before_action :remove_duplicate_products, only: [:create, :update]

  # GET /recipes
  # GET /recipes.json
  def index
    logger.info "################  INDEX"

    if params[:show_all] == 'true' && current_user.try(:admin?)
      @recipes = Recipe.all
    else
      @recipes = find_recipes_this_week
    end
    #@avail_recipes = Recipe.joins(:ingredients).joins(:ingredients => :products).first
    #logger.info "################# YALAAAA #{@ingredients.first.quantity}"
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    logger.info "################  SHOW RECIPE"

  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(@filtered_params)
    respond_to do |format|
      if @recipe.save!
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.'}
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update!(@filtered_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_to_panier
    respond_to do |format|
      if @panier.recipes << @recipe 
        format.html { redirect_to recipes_url, notice: 'Recipe was successfully added to panier.' }
        format.json { render :recipes_url, status: :ok}
      else
        format.html { render :index }
        format.json { render json: @recipe.errors, status: :unprocessable_entity } 
      end
    end
  end

  def remove_from_panier
    respond_to do |format|
      if @panier.recipes.delete(@recipe)
        format.html { redirect_to recipes_url, notice: 'Recipe was successfully removed.' }
        format.json { render :recipes_url, status: :ok}
      else
        format.html { render :index }
        format.json { render json: @recipe.errors, status: :unprocessable_entity } 
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:id, :title, :instructions, :short_desc, :panier_id, :ingredients_attributes => [:product_id, :quantity, :_destroy])
    end

end
