class UsersController < ApplicationController
  def index
    @Users = User.all
  end
end
