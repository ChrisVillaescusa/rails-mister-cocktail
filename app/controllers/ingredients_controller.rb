class IngredientsController < ApplicationController
  before_action :find_ingredient, only: [:show, :destroy, :edit, :update]

  def index
    @ingredients = Ingredient.order(:name)
    # @ingredients = @ingredients.sort_by {|obj| obj.name } #.reverse
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    redirect_to ingredients_path
  end

  def new
      @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render :new
    end
  end

  def edit
  end


  def update
    @ingredient.update(ingredient_params)
  end

  def destroy
    @ingredient.destroy
  end

private

  def find_ingredient
    @ingredient = Ingredient.find(params[:id])
  end


  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
