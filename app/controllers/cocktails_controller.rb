class CocktailsController < ApplicationController

  def show
    @cocktail = Cocktail.find(params[:id])
    @review = Review.new
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
     @search = params["search"]
    if @search.present?
      @name = @search[:query]
      # @cocktails = Cocktail.where(["name = ?", @name])
      # select cock from cocktail where cocktails.doses.ingredients.name = @name
      @cocktails = Cocktail.joins("INNER JOIN doses ON doses.cocktail_id = cocktails.id  INNER JOIN ingredients ON ingredients.id = doses.ingredient_id")
                           .where("ingredients.name like ?", @name)
    else
      render :index
    end
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

  private

  def cocktails_params
    params.require(:cocktail).permit(:name, :pic_url, :search)
  end

end
