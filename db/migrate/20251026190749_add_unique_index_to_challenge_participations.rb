class AddUniqueIndexToChallengeParticipations < ActiveRecord::Migration[7.1]
  def change
    add_index :challenge_participations, [:user_id, :challenge_id], unique: true
  end
end
