class AddPrevOutgoingCountToSetting < ActiveRecord::Migration[5.2]
  def change
    add_column :settings, :prev_outgoing_count, :integer, :default => 0
  end
end
