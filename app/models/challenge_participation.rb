class ChallengeParticipation < ApplicationRecord
  belongs_to :challenge
  belongs_to :user

  validates :challenge_id, :user_id, presence: true
  validates :total_points, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :user_id, uniqueness: { scope: :challenge_id,
                                    message: "ya está inscrito en este challenge" }

  before_save :set_total_points

  private
    def set_total_points
      if total_points.nil?
        self.total_points = 0
      end
    end
end
