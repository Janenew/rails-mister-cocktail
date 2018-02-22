class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show]

  def show
    @cocktails = @ingredient.cocktails
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

end
