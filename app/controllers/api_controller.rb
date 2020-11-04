
require 'telegram/bot'

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

    client = Telegram::Bot::Client.new("980059077:AAGCsCWK0TsJiCa739mS8KJn0p645QxmxV8", "username")

    begin
      
      text = 'ОБЗВОН: Загрузка файла на сервер ' + request.host 
#      client.send_message(chat_id: -1001309981363, text: text)

      file = params[:name_of_file_param]
      upload = "LOAD DATA LOCAL INFILE '" + file.tempfile.path + "' INTO TABLE outgoings (telephone) SET date_created = CURRENT_TIMESTAMP, status = 'INSERTED';"
      results = ActiveRecord::Base.connection.execute(upload)
      text = 'ОБЗВОН: Загрузка файла на сервер ' + request.host + ' прошла успешна'
 #     client.send_message(chat_id: -1001309981363, text: text)
      render plain: ""
    rescue Exception => error
      logger.debug(error)
      text = 'ОБЗВОН: Ошибка при загрузки на сервер ' + request.host + ': ' + error.to_s
      client.send_message(chat_id: -1001309981363, text: text)
      render plain: "", status: 500, message: error.to_s 
    end
    
  end

  def clear
    sql = "DELETE FROM outgoings;"		
    results = ActiveRecord::Base.connection.execute( sql )  
    render plain: ""  
  end

end
