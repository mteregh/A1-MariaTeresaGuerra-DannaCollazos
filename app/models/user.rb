class User < ApplicationRecord
  has_many :challenge_participations
  has_many :challenges, through: :challenge_participations
  has_many :notifications
end
