class CreateChallenges < ActiveRecord::Migration[8.0]
  def change
    create_table :challenges do |t|
      t.string :name
      t.text :description
      t.date :start
      t.date :end
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
