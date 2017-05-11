class CocktailsController < ApplicationController

 before_action :find_cocktail, only: [:show]

  def index
    @cocktails = Cocktail.order(:name)
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  # def doses
  #   @doses = Dose.where(cocktail_id: @cocktail.id)
  # end

  def new
      @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end


  def update
    @cocktail.update(cocktail_params)
  end

  def destroy
    @cocktail.destroy
  end

private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end


  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

end
