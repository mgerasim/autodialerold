class AddOutgoingCount24hToSettings < ActiveRecord::Migration[5.2]
  def change
    add_column :settings, :outgoing_count_24h, :integer, :default => 0
  end
end
