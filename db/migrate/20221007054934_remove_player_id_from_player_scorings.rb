class RemovePlayerIdFromPlayerScorings < ActiveRecord::Migration[6.1]
  def change
    remove_column :player_scorings, :player_id, :integer, null: false
  end
end
