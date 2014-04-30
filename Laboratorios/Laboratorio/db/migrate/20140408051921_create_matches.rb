class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.date :date
      t.string :phase
      t.string :state
      t.references :local_team, index: true
      t.references :visit_team, index: true
      t.integer :local_scores
      t.integer :visit_scores
      t.references :winner, index: true
      t.references :looser, index: true
      t.boolean :draw?
      t.references :group, index: true
      t.references :stadium, index: true

      t.timestamps
    end
  end
end
