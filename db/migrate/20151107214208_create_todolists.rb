class CreateTodolists < ActiveRecord::Migration
  def change
    create_table :todolists do |t|
      t.string :titulo
      t.text :descripcion
      t.boolean :estado

      t.timestamps null: false
    end
  end
end
