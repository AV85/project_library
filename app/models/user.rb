# frozen_string_literal: true

class User < ApplicationRecord
  extend Enumerize

  enumerize :role, in: { admin: 1, super_moderator: 2, moderator: 3 }

  devise :database_authenticatable

  has_one_attached :avatar
end
