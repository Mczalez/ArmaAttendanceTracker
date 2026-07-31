class ChangePlayerUnitEntryToInteger < ActiveRecord::Migration[8.1]
  def change
    remove_column :players, :unit, :string
  end
end
