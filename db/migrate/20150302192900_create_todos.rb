class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.integer :user_id
      t.string :notes
      t.boolean :finished, :default => false
      t.timestamps null: false
    end
  end
end
