class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :challenge_participations, dependent: :destroy
  has_many :challenges, through: :challenge_participations
  has_many :notifications
  # nuevos
  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges
  has_many :notifications, dependent: :destroy

  # agregar validations
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, presence: true, length: { maximum: 80 }
  validates :last_name,  presence: true, length: { maximum: 80 }

  def admin?
    role == "admin"
  end

  def challenge_creator?
    role == "challenge-creator"
  end
end
