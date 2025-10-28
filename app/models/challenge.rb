class Challenge < ApplicationRecord
  belongs_to :user
  has_many :challenge_participations, dependent: :destroy
  has_many :users, through: :challenge_participations
  has_many :progress_entries, dependent: :destroy

  validates :name, presence: true, length: { maximum: 120 }
  validates :description, presence: true
  validates :start, :end, presence: true
  validate :end_after_start

  private

  def end_after_start
    return if start.blank? || self.end.blank?
    if self.end < start
      errors.add(:end, "debe ser posterior a la fecha de inicio")
    end
  end
end
