class User < ApplicationRecord
  validates :account, presence: true
  validates :account, uniqueness: true
end
