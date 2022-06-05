class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.date :due_date
      t.integer :priority
      t.string :created_by
      t.boolean :is_completed

      t.timestamps
    end
  end
end
