class Group < ApplicationRecord
  belongs_to :user
  has_many :foods, dependent: :destroy
  validates :name, presence: true
  validates :icon, presence: true
end
