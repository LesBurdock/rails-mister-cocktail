class CocktailsController < ApplicationController

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def create
    @cocktail = Cocktail.new(cocktails_params)
    if @cocktail.save
      redirect_to cocktails_path
    else
      render :new
    end
    @cocktail.save
  end

  def new
    @cocktail = Cocktail.new
  end

  def index
    @cocktails = Cocktail.all
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(cocktails_params)
    @cocktail.save
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
  end

  def search
    @search = params["search"]
    if @search.present?
      @name = @search["name"]
      @cocktail = Cocktail.where(["name = ?", @name])
      # cannot do this as its not params if i redirect there it looks for the params id and gets and object.
      redirect_to cocktail_path(@cocktail)
    else
      render :index
    end
  end

  private
  def cocktails_params
    params.require(:cocktail).permit(:name, :pic_url, :search)
  end
end
