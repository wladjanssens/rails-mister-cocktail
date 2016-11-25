class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  # GET /restaurants
  # GET /restaurants.json
  def index
    @cocktails = Cocktail.all
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    @cocktails = @cocktail.doses
  end

  # GET /restaurants/new
  def new
    @cocktail = Cocktail.new
    @ingredients = Ingredient.all
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    Cocktail.create(cocktail_params)
    redirect_to cocktails_path
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cocktail
      @cocktail = Cocktail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cocktail_params
      params.require(:cocktail).permit(:name, :description, :rating, :photo, :photo_cache)
    end
end
