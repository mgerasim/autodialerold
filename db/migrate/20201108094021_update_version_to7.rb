class UpdateVersionTo7 < ActiveRecord::Migration[5.2]
  def change
    setting = Setting.first
    setting.version = 7
    setting.save
  end
end
