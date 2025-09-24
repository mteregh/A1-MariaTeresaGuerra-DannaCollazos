class Challenge < ApplicationRecord
  belongs_to :user
  has_many :challenge_participations
  has_many :users, through: :challenge_participations
end
