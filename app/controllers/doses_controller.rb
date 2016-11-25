class DosesController < ApplicationController
  before_action :set_dose, only: [:destroy]

  # GET /restaurants
  # GET /restaurants.json
 def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.doses.build(dose_params)
    @dose.save
    redirect_to cocktails_path
  end

  def destroy
    @dose.destroy
    respond_to do |format|
      format.html { redirect_to dose_url, notice: 'Coktail was successfully destroyed.' }
    end
  end
  # GET /restaurants/new

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dose
      @dose = Dose.find(params[:id])
    end

    def dose_params
      params.require(:dose).permit(:description, :ingredient_id)
    end
    # Never trust parameters from the scary internet, only allow the white list through.

end
