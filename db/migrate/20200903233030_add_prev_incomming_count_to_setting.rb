class AddPrevIncommingCountToSetting < ActiveRecord::Migration[5.2]
  def change
    add_column :settings, :prev_incomming_count, :integer, :default => 0
  end
end
