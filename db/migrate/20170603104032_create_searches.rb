class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :keyword
      t.string :state
      t.string :country
      t.integer :no_bed
      t.integer :no_room
      t.integer :no_guest
      t.integer :min_price
      t.integer :max_price
      t.boolean :smoker
      t.boolean :pets
      t.boolean :instant_book
      t.string :property_type

      t.timestamps
    end
  end
end
