class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string     :item_name          , null: false
      t.text       :description        , null: false
      t.integer    :category_id        , null: false
      t.integer    :condition_id       , null: false
      t.integer    :burden_id          , null: false
      t.integer    :region_id          , null: false
      t.integer    :until_shipping_id  , null: false
      t.integer    :price              , null: false
      t.references :user               , null: false, foreign_key: true
      t.integer    :genre_id           , null: false
      t.timestamps
    end
  end
end
