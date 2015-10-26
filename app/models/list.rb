class List < ActiveRecord::Base
  has_many :users, dependent: :destroy
  accepts_nested_attributes_for :users
  validates_associated :users
  validates :price_limit, presence: true
end
