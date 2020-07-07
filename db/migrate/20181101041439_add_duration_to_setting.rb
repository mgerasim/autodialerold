class AddDurationToSetting < ActiveRecord::Migration[5.1]
  def change
    add_column :settings, :duration, :integer
  end
end
