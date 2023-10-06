class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :burden
  belongs_to :region
  belongs_to :until_shipping
  belongs_to :user

  validates :image, presence: true
  validates :item_name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :burden_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :region_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :until_shipping_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true,
    numericality: { onry_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, allow_blanl:true}
  
end
