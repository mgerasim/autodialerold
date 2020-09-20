class UpdateVersion < ActiveRecord::Migration[5.2]
  def change
    setting = Setting.first
    setting.version = 3
    setting.save
  end
end
