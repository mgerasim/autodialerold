class AddAutospsToSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :settings, :autosps, :boolean
  end
end
