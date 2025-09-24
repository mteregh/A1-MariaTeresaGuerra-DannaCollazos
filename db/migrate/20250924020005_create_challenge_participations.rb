class CreateChallengeParticipations < ActiveRecord::Migration[8.0]
  def change
    create_table :challenge_participations do |t|
      t.references :challenge, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :total_points
      t.datetime :joined_at

      t.timestamps
    end
  end
end
