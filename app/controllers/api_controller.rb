class ApiController < ApplicationController

  skip_before_action :require_login, :only => [:settings, :count]

  def settings
    setting = Setting.first    
    render :json => setting
  end

  def count
  end
end
