class HomeController < ApplicationController
  def index
    @Users = Player.all
  end


end
