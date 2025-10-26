class Challenge < ApplicationRecord
  belongs_to :user
  has_many :challenge_participations, dependent: :destroy
  has_many :users, through: :challenge_participations
  has_many :progress_entries, dependent: :destroy

  validates :name, presence: true, length: { maximum: 120 }
  validates :start, :end, presence: true
  validate :end_after_start

end
