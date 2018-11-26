class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|

      t.references :project, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.date :deadline, null: false
      t.boolean :closed, null: false, default: false
      t.references :user, null: false

      t.timestamps
    end
  end
end
