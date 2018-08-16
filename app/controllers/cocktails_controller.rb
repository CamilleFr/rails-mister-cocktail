class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.create!(cocktail_params)
    redirect_to cocktails_path(@cocktail)
  end

  def edit
     @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    respond_to do |format|
      format.html {redirect_to cocktails_url, notice: 'cocktail was well deleted'}
      format.json {head :no_content}
    end
  end
end


private

def cocktail_params
  params.require(:cocktail).permit(:name, :dose, :ingredients)
end
