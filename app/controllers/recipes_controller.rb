class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def create
    @new_recipe = Recipe.new(recipe_params)
    if @new_recipe.save
      redirect_to root_path
    else
      redirect_to new_recipe_path, alert: 'Error creating recipe'
    end
  end

  def new
    @new_recipe = Recipe.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to root_path
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :source, :description, :yield, :cooktime, :ingredients, :instructions)
  end

end
