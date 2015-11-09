class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.references :todolist, index: true, foreign_key: true
      t.text :nombre

      t.timestamps null: false
    end
  end
end
