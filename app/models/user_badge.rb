class UserBadge < ApplicationRecord
  belongs_to :user
  belongs_to :badge

  # no deja que esten duplicados
  validates :user_id, uniqueness: { scope: :badge_id }
end
