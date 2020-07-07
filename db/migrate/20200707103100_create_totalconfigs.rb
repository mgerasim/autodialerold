class CreateTotalconfigs < ActiveRecord::Migration[5.2]
  def change
    create_table :totalconfigs do |t|
      t.string :title_setting_trunk
      t.string :title_app
      t.string :template_channel

      t.timestamps
    end
  end
end
