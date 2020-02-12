class GossipsController < ApplicationController

def new
  @gossip = Gossip.new
end

def create
  @gossip = Gossip.create('user_id' => 1, 'title' => params[:title], 'content' => params[:content])
  puts @gossip.errors.messages
  if @gossip.errors.messages == {}
    redirect_to '/gossips/index'
  else
    redirect_to '/gossips/new'
  end
end

end
