class ApiController < ApplicationController

  skip_before_action :require_login, :only => [:settings, :count]

  def settings
    setting = Setting.first    
    render :json => setting
  end

  def count
    render plain: Outgoing.count.to_s
  end
end
