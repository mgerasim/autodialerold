class InsertTotalConfig < ActiveRecord::Migration[5.2]
  def change
    config = Totalconfig.new
    config.title_app = "ТОПОЛЬ-М"
    config.title_setting_trunk = "Рабочие каналы:"
  end
end
