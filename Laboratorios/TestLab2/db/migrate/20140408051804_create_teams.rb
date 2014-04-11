class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :name_c
      t.string :flag
      t.string :uniform
      t.string :text

      t.timestamps
    end
  end
end
