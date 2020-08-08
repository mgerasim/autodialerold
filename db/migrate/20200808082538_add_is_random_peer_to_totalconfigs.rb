class AddIsRandomPeerToTotalconfigs < ActiveRecord::Migration[5.2]
  def change
    add_column :totalconfigs, :is_random_peer, :boolean, :default => false
  end
end
