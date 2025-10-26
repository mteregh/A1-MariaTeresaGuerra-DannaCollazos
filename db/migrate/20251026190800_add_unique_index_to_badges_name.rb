class AddUniqueIndexToBadgesName < ActiveRecord::Migration[7.1]
  def change
    add_index :badges, :name, unique: true
  end
end
