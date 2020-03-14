class User < ApplicationRecord
  extend Enumerize

  enumerize :role, in: { admin: 1, super_moderator: 2, moderator: 3 }

  devise :database_authenticatable

end