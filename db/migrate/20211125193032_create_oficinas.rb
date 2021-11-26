class CreateOficinas < ActiveRecord::Migration[6.1]
  def change
    create_table :oficinas do |t|
      t.string :numero
      t.references :edificio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
