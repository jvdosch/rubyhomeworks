class RecipesController < ApplicationController
  def index

    # store keyword
    @keyword = params[:keyword] || :chocolate

    # get results from puppy place
    @recipes = Recipe.for(@keyword)

  end
end