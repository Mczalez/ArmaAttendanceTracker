class PlayersController < ApplicationController
  def index
    @Users = Player.all
  end

  def new
    @user = Player.new
  end

  def edit
    @user = Player.find(params[:id])
  end

  def delete
    @user = Player.find(params[:id])
  end

  def create
    @user = Player.new(user_params)

    if @user.save
      redirect_to root_path, notice: "User created."
    else
      render :new
    end
  end

  def update
    @user = Player.find(params[:id])

    if @user.update(user_params)
      redirect_to root_path, notice: "User updated."
    else
      redirect_to root_path, alert: "Unable to update user."
    end
  end

  def destroy
    @user = Player.find(params[:id])

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
    params.require(:player).permit(
      :name,
      :steam_id,
      :discord,
      :activity
    )
  end
end
