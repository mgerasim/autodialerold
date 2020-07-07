class AddIncomingContextToSettings < ActiveRecord::Migration[5.2]
  def change
    add_column :settings, :incoming_context, :string
  end
end
