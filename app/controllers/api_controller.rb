class ApiController < ApplicationController

  skip_before_action :require_login

  protect_from_forgery with: :null_session

  def settings
    setting = Setting.first    
    render :json => setting
  end

  def count
    render plain: Outgoing.count.to_s
  end

  def version
    render plain: "2"    
  end

  def start
    setting = Setting.first
    setting.is_enabled = true
    setting.save
    render plain: ""
  end

  def stop
    setting = Setting.first
    setting.is_enabled = false;
    setting.save
    render plain: ""
  end

  def upload

    file = params[:name_of_file_param]

    upload = "LOAD DATA LOCAL INFILE '" + file.tempfile.path + "' INTO TABLE outgoings (telephone) SET date_created = CURRENT_TIMESTAMP, status = 'INSERTED';"

        results = ActiveRecord::Base.connection.execute(upload)

        Rails.logger.error results

    render plain: ""
  end

end
