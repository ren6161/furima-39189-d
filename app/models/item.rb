class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user

  belongs_to :category
  belongs_to :shipping_area
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :days_to_ship

  has_one_attached :image

  validates :image,              presence: true
  validates :name,               presence: true
  validates :description,        presence: true
  validates :category_id,        presence: true
  validates :condition_id,       presence: true
  validates :shipping_cost_id,   presence: true
  validates :shipping_area_id,   presence: true
  validates :days_to_ship_id,    presence: true
  validates :price,              presence: true
  validates :price,              numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id,        numericality: { other_than: 0 }
  validates :condition_id,       numericality: { other_than: 0 }
  validates :shipping_area_id,   numericality: { other_than: 0 }
  validates :shipping_cost_id,   numericality: { other_than: 0 }
  validates :days_to_ship_id,    numericality: { other_than: 0 }
end
