class PaniersController < ApplicationController
  before_action :set_panier, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /paniers
  # GET /paniers.json
  def index
    @paniers = current_user.paniers.all
  end

  # GET /paniers/1
  # GET /paniers/1.json
  def show
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
    # Use callbacks to share common setup or constraints between actions.
    def set_panier
      unless @panier = current_user.paniers.where(params[:id]).first
        flash[:alert] = 'Panier requested not found.'
        redirect_to root_url
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def panier_params
      params.require(:panier).permit(:semaine, :coute)
    end
end
