class UpdateVersionTo6 < ActiveRecord::Migration[5.2]
  def change
    setting = Setting.first
    setting.version = 6
    setting.save
  end
end
