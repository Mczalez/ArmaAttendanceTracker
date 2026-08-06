class PlayersController < ApplicationController
  def index
    @unit = Unit.find(params[:unit_id])
    @players = @unit.players
  end

  def new
    @player = Player.new
    @unit = Unit.find(params[:unit_id])
  end

  def edit
    @player = Player.find(params[:id])
  end

  def delete
    @player = Player.find(params[:id])
    @unit = @player.unit
  end

  def create
    @player = Player.new(user_params)
    @unit = Unit.find_by(id: @player.unit_id)

    unless @unit
      redirect_to units_path, alert: "Please select a valid unit."
      return
    end

    if @player.save
      redirect_to players_path(unit_id: @unit.id), notice: "Player created."
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    @player = Player.find(params[:id])

    if @player.update(user_params)
      redirect_to players_path(unit_id: @player.unit_id), notice: "Player edited."
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @unit = @player.unit

    submitted_name = params[:name]

    if submitted_name == @player.name
      @player.destroy
      redirect_to players_path(unit_id: @player.unit_id), notice: "Player deleted."
    else
      flash.now[:alert] = "Name does not match."
      render :delete, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:player).permit(
      :unit_id,
      :name,
      :steam_id,
      :discord,
      :activity
    )
  end
end
