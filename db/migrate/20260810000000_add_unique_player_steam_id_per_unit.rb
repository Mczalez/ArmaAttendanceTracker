class AddUniquePlayerSteamIdPerUnit < ActiveRecord::Migration[8.1]
  def change
    add_index :players,
              [:unit_id, :steam_id],
              unique: true,
              name: "index_players_on_unit_id_and_steam_id"
  end
end
