class CreateStatsps < ActiveRecord::Migration[5.1]
  def change
    create_table :statsps do |t|
      t.integer :countreg
      t.integer :freeoper
      t.integer :newsps
      t.integer :abonqueue

      t.timestamps
    end
  end
end
