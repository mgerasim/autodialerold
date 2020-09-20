class AddVersionToSettings < ActiveRecord::Migration[5.2]
  def change
    add_column :settings, :version, :integer, :default => 1
  end
end
