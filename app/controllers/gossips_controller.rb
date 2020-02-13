require 'pry'

class GossipsController < ApplicationController

  before_action :check_login, only: [:create]


  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.create('user_id' => session[:user_id], 'title' => params[:title], 'content' => params[:content])
    puts @gossip.errors.messages
    if @gossip.errors.messages == {}
      redirect_to '/gossips'
    else
      redirect_to '/gossips/new'
    end
  end

  def check_login
    unless session[:user_id]
      flash[:danger] = "Please log in."
      redirect_to ("/")
    end
  end

  def index
    #@gossip = Gossip.find(params[:id])
    @all_gossips = Gossip.all
  end

  def show 
    @gossip = Gossip.find(params['id'])
    @user = User.find(@gossip.user_id)
    @city = City.find(@user.city_id)
  end
  def update
    puts "hello world"
    @model = Model.find(params[:id])
    if @model.update(tes_params)
      redirect_to @model
    else
      render :edit
    end
  end
  def edit
    @gossip = Gossip.find(params['id'])
  end

end

def user_show_path(id)
  return "/users/#{id}"
end

def gossips_show_path(id)
  return "/gossips/#{id}"
end

def city_show_path(id)
  return "/cities/#{id}"
end