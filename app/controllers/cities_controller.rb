class CitiesController < ApplicationController
  def show
    @city = City.find(params['id'])
    @users = @city.users
    @gossips = []
    @users.each do |user|
      @gossips << user.gossips
    end
    @gossips.flatten!
  end

end
