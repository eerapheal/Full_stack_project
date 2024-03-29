class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :motorcycle, null: false, foreign_key: true
      t.string :city
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
