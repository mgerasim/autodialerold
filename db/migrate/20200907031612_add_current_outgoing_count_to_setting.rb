class AddCurrentOutgoingCountToSetting < ActiveRecord::Migration[5.2]
  def change
    add_column :settings, :current_outgoing_count, :integer
  end
end
