class Book < ApplicationRecord
  has_and_belongs_to_many :authors
  belongs_to :category
  validates :name, :description, presence: true
end
