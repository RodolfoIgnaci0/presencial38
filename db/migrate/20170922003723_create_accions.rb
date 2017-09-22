class CreateAccions < ActiveRecord::Migration[5.1]
  def change
    create_table :accions do |t|
      t.references :user, foreign_key: true
      t.references :tarea, foreign_key: true
      t.boolean :hecho, default: false

      t.timestamps
    end
  end
end
