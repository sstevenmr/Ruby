class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.date :date
      t.integer :id_phase
      t.integer :id_status
      t.integer :id_team
      t.integer :id_team
      t.integer :id_scores
      t.string :ganador
      t.string :perdedor
      t.boolean :empate?
      t.integer :id_group
      t.integer :id_stadium

      t.timestamps
    end
  end
end
