class UpdateVersionTo4 < ActiveRecord::Migration[5.2]
  def change
    setting = Setting.first
    setting.version = 4
    setting.save
  end
end
