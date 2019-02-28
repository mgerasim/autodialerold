class CreateBlves < ActiveRecord::Migration[5.1]
  def change
    create_table :blves do |t|
      t.bigint :uid
      t.string :status
      t.string :direction
      t.string :other_leg
      t.string :other_leg_domain
      t.string :rank
      t.string :uuid

      t.timestamps
    end
  end
end
