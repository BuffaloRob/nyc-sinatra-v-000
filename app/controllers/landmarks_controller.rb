class LandmarksController < ApplicationController

  get '/' do
    redirect "/landmarks"
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    # @figures = Figure.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get 'landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erh :'/landmarks/edit'
  end

  post '/landmarks' do
    # binding.pry
    @landmark = Landmark.create(params[:landmark])
    @landmark.save

    redirect "/landmarks/#{@landmark.id}"
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find_by(params[:id])
    @landmark.update(params[:landmark])
    @landmark.save

    redirect "/landmarks/#{@landmark.id}"
  end

end
