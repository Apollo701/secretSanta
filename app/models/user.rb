class User < ActiveRecord::Base
  belongs_to :list
  validates :name,  presence: true, length: { maximum: 50, minimum: 2 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 50 },
                  format: { with: VALID_EMAIL_REGEX }
end
