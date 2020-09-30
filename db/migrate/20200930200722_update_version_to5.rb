class UpdateVersionTo5 < ActiveRecord::Migration[5.2]
  def change
    setting = Setting.first
    setting.version = 5
    setting.save
  end
end
