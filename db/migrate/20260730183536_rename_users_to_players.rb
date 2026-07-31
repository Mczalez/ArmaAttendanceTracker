class RenameUsersToPlayers < ActiveRecord::Migration[8.1]
  def change
    rename_table :users, :players
  end
end
