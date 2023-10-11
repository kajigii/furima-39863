class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string      :post_code,    null: false
      t.integer     :region_id,    null: false
      t.string      :city
      t.string      :street_address
      t.string      :building
      t.string      :telephone_number 
      t.references  :purchase,      null: false, foreign_key: true
      t.timestamps
    end
  end
end

