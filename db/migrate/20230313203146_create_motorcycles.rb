class CreateMotorcycles < ActiveRecord::Migration[7.0]
  def change
    create_table :motorcycles do |t|
      t.string :name
      t.string :image
      t.text :description
      t.decimal :price
      t.string :model
      t.boolean :available, default: true

      t.timestamps
    end
  end
end
