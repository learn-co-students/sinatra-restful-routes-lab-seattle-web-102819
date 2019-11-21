class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :method_override, true
  end

  # code actions here!
  #create 
  get '/recipes/new' do
    # @recipe = Recipe.new
    erb :new
  end 

  post '/recipes' do 
    @recipe = Recipe.new(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    @recipe.save 
    redirect "/recipes/#{@recipe.id}"
  end 

  get '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])
    erb :show
  end

  delete '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    redirect "/recipes"
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end


end
