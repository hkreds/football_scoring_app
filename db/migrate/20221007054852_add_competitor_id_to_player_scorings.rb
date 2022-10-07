class AddCompetitorIdToPlayerScorings < ActiveRecord::Migration[6.1]
  def change
    add_column :player_scorings, :competitor_id, :integer, null: false
  end
end
