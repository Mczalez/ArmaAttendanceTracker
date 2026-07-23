class HomeController < ApplicationController
  def index
    @Users = User.all
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to rot_path, notice: "User created."
    else
      redirect_to root_path, alert: "Unable to create user."
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to root_path, notice: "User updated."
    else
      redirect_to root_path, alert: "Unable to update user."
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to root_path, notice: "User deleted."
  end
end
