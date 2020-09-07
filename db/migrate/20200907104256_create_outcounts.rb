class CreateOutcounts < ActiveRecord::Migration[5.2]
  def change
    create_table :outcounts do |t|
      t.integer :count

      t.timestamps
    end
  end
end
