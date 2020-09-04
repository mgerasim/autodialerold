class CreateIncommings < ActiveRecord::Migration[5.2]
  def change
    create_table :incommings do |t|
      t.string :phone

      t.timestamps
    end
  end
end
