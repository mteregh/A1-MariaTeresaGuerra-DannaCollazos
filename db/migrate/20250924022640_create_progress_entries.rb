class CreateProgressEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :progress_entries do |t|
      t.references :challenge, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
