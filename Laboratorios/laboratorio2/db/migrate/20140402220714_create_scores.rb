class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :id_team

      t.timestamps
    end
  end
end
