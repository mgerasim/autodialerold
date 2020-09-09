class ApiController < ApplicationController

  skip_before_action :require_login

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

end
