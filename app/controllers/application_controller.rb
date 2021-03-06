require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
    # binding.pry
    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  post '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(params)
    erb :show
    #  redirect to "/recipes/#{@recipe.id}"
  end

  post '/recipes/:id/delete' do
    @recipe = Recipe.find(params["id"])
    @recipe.delete
    redirect to "/recipes"
  end
end
