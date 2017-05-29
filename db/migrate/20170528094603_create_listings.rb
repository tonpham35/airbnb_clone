class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.references :user
      t.string :address1
      t.string :address2
      t.integer :postalcode
      t.string :state
      t.string :country
      t.integer :no_bed
      t.integer :no_room
      t.integer :max_guest
      t.integer :price_per_day
      t.string :currency
      t.string :content

      t.timestamps
    end
  end
end
