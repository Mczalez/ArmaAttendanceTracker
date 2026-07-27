class HomeController < ApplicationController
  def index
    @Users = User.all
  end


end
