class UsersController < ApplicationController
  def index
    @Users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def delete
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: "User created."
    else
      render :new
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

    submitted_name = params[:name]

    if submitted_name == @user.name
      @user.destroy
      redirect_to root_path, notice: "User deleted."
    else
      flash.now[:alert] = "Name does not match."
      render :delete, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :steam_id,
      :discord,
      :activity
    )
  end
end
