class UsersController < ApplicationController
  def show
    @user = User.find(params['id'])
  end

  def new
  end

  def create
    @user = User.create('email' => params['email'], 'password' => params['password'], 'city_id' => City.all.sample.id)
    @user.errors.each do |error| 
      puts "aaaa"
      puts error
    end
    if @user.save
      flash[:success] = "user créé !"
    else
      @user.errors.each do |error| 
        puts "aaaa"
        puts error
      end
      flash[:success] = "Error, nous n'avons pas pu te créer"
      #render :new
    end
    redirect_to('/')
    #redirect_to('/')
  end

end
