class UpdateVersion < ActiveRecord::Migration[5.2]
  def change
    setting = Setting.first
    setting = Setting.create if setting == nil
    setting.version = 3
    setting.save
  end
end
