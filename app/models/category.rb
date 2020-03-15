# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :books
  validates :name, :description, presence: true
end
