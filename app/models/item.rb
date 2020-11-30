class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :freight
  belongs_to :ship_state
  belongs_to :ship_day

  validates :name, presence: true
  with_options presence: true do
    validates :name
    validates :description
    validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000}
    validates :image
    with_options numericality: {other_than: 1} do
      validates :category_id
      validates :status_id
      validates :freight_id
      validates :ship_state_id
      validates :ship_day_id
    end
  end
end