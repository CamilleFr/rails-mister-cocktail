class DosesController < ApplicationController

  def show
    @doses = Dose.all
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    allowed_params = params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
    @dose = Dose.new(allowed_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail_id = @cocktail.id
    @dose.save

    if @dose.save

      redirect_to cocktails_path(@cocktail.id)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:cocktail_id])
    @dose = Dose.destroy
  end
end
