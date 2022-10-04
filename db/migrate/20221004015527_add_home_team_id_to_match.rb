class AddHomeTeamIdToMatch < ActiveRecord::Migration[6.1]
  def change
    add_column :matches, :home_team_id, :integer
  end
end
