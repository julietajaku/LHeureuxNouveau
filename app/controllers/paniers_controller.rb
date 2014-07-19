class PaniersController < ApplicationController
  include ApplicationHelper, PaniersHelper

  before_action :authenticate_user!
  before_action :set_panier, only: [:show, :edit, :update, :destroy]

  # GET /paniers
  # GET /paniers.json
  def index
    @paniers = current_user.paniers.all
  end

  # GET /paniers/1
  # GET /paniers/1.json
  def show
    logger.info "#################### show"

    @panier.recipes.each do |recipe|
      logger.info "#################### #{recipe.name}"
    end
  end

  # GET /paniers/new
  def new
    @panier = current_user.paniers.new
  end

  # GET /paniers/1/edit
  def edit
  end

  # POST /paniers
  # POST /paniers.json
  def create
    @panier = current_user.paniers.new(panier_params)
    @week = Week.find(panier_params[:week_id])
    @week.paniers << @panier

    respond_to do |format|
      if @panier.save
        format.html { redirect_to @panier, notice: 'Panier was successfully created.' }
        format.json { render :show, status: :created, location: @panier }
      else
        format.html { render :new }
        format.json { render json: @panier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paniers/1
  # PATCH/PUT /paniers/1.json
  def update
    respond_to do |format|
      if @panier.update(panier_params)
        format.html { redirect_to @panier, notice: 'Panier was successfully updated.' }
        format.json { render :show, status: :ok, location: @panier }
      else
        format.html { render :edit }
        format.json { render json: @panier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paniers/1
  # DELETE /paniers/1.json
  def destroy
    @panier.destroy
    respond_to do |format|
      format.html { redirect_to paniers_url, notice: 'Panier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def panier_params
      params.require(:panier).permit(:coute, :week_id, :user_id)
    end
end
