class DosesController < ApplicationController
   before_action :set_cocktail

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(doses_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private
  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def doses_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
