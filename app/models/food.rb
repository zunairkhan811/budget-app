class Food < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :groups
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :group_id, presence: true
end
