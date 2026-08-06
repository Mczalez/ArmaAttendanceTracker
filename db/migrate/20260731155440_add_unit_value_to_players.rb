class AddUnitValueToPlayers < ActiveRecord::Migration[8.1]
  def change
    add_column :players, :unit, :string
  end
end
