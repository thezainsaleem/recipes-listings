class Api::V1::RecipesController < ApplicationController
  def index
    render json: RecipeService.new({}).get_page(0).to_json
  end

  def show
    render json: RecipeService.new({}).get_detail(params[:id]).to_json
  end
end