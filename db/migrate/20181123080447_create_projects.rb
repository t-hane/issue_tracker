class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.text :goal, null: false
      t.date :deadline, null: false

      t.timestamps
    end
  end
end
