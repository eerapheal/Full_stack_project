class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :users, null: false, foreign_key: {to_table: :users}
      t.references :motorcycles, null: false, foreign_key: {to_table: :motorcycles}
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
