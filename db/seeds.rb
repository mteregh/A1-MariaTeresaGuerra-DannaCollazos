# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#


ActiveRecord::Base.transaction do

  (1..6).each do |num|
    User.find_or_create_by!(email: "email#{num}@gmail.com") do |u|
      u.password = "password"
      u.first_name = "User number: #{num}"
      u.last_name = "Last name"
    end
  end

  admin = User.find_or_create_by!(email: 'admin@gmail.com') do |u|
    u.first_name = 'Admin'
    u.password = "password"
    u.last_name  = 'Admin'
    u.role       = 'admin' if u.respond_to?(:role)
  end

  challenge_creator = User.find_or_create_by!(email: 'challenge_creator@gmail.com') do |u|
    u.first_name = 'Challenge'
    u.password = "password"
    u.last_name  = 'Creator'
    u.role       = 'challenge-creator' if u.respond_to?(:role)
  end

  # Badges 
  (1..10).each do |num|
    Badge.find_or_create_by!(name: "Badge #{num}")
  end

  # Challenges 
  (1..5).each do |num|
    challenge = Challenge.find_or_create_by!(
      name: "Challenge #{num}",
      user: challenge_creator
    ) do |c|
      c.description = "Super challenge number #{num}"
      c.start = Date.today
      c.end = Date.today + 7
    end

    # Participantes, todos los usuarios excepto los primeros 3
    users = User.where('id > 3')
    users.each do |u|
      ChallengeParticipation.find_or_create_by!(challenge: challenge, user: u)
    end

    # Entradas de progreso 
    (1..3).each do |q|
      ProgressEntry.find_or_create_by!(challenge: challenge, quantity: q)
    end
  end

  # Asignar badges a usuarios
  if defined?(UserBadge)
    User.all.each do |user|
      Badge.all.sample(2).each do |badge|
        UserBadge.find_or_create_by!(user: user, badge: badge) do |ub|
          ub.awarded_at = Time.current if ub.respond_to?(:awarded_at)
        end
      end
    end
  end
end


