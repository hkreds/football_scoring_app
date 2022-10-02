class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.integer :convention_id, null: false
      t.datetime :start_time, null: false
      t.integer :home_goal
      t.integer :away_goal

      t.timestamps
    end
  end
end
