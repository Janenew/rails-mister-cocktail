class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :destroy]
  def index
    # @cocktails = Cocktail.all
    @cocktails = Cocktail.where("name ILIKE ?", "%#{params[:keyword]}%")
  end

  def show
    @dose = Dose.new
    @doses = @cocktail.doses.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail), notice: 'Cocktail succesfully created'
    else
      render :new
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path, notice: 'Cocktail succesfully destroyed'
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id].to_i)
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :image_url)
  end
end
