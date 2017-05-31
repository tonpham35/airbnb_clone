class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :listing, foreign_key: true
      t.integer :total_price
      t.string :currency
      t.date :start_date
      t.date :end_date
      t.string :message
      t.integer :num_guest

      t.timestamps
    end
  end
end
