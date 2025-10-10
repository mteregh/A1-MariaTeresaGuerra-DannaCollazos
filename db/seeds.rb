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

(1..6).each do |num|
  user = User.create(email: "email#{num}@gmail.com", first_name: "User number: #{num}", last_name: "Last name")
  user.save
end

admin = User.create(email: 'admin@gmail.com', first_name: 'Admin', last_name: 'Admin', role: 'admin')
admin.save
challenge_creator = User.create(email: 'challenge_creator@gmail.com', first_name: 'Challenge', last_name: 'Creator', role: 'challenge-creator')
challenge_creator.save

(1..10).each do |num|
  badge = Badge.new
  badge.name = "Badge #{num}"
  badge.save
end

(1..5).each do |num|
  challenge = Challenge.create(user: challenge_creator, name: "Challenge #{num}", description: "Super challenge number #{num}", start: Date.today, end: Date.today + 7)
  users = User.where('id > 3')
  challenge.users << users
  progress_entries = (1..3).map do |num|
    progress_entry = ProgressEntry.new
    progress_entry.quantity = num
    progress_entry.save
    progress_entry
  end
  challenge.progress_entries << progress_entries
  challenge.save
end
