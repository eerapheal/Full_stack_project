class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :users, null: false, foreign_key: true, index: true
      t.references :motorcycles, null: false, foreign_key: true, index: true
      t.string :city
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
