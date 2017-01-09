class Api::PokemonController < ApplicationController
  def index
    @pokemon = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def create
    @pokemon = Pokemon.create(params[:pokemon])
  end
end
