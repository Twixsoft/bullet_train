class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.references :project, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
