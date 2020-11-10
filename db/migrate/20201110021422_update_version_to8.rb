class UpdateVersionTo8 < ActiveRecord::Migration[5.2]
  def change
    setting = Setting.first
    setting.version = 8
    setting.save
  end
end
