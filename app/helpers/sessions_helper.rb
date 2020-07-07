module SessionsHelper
  def authenticate?(string)
    
    Digest::MD5::hexdigest(string) == "e7822c3412d066580ce21aa0ba2055eb"

  end

  def log_in
    session[:logged_in] = true
  end

  def log_out
    session[:logged_in] = false
  end

  def logged_in?
    session[:logged_in]
  end

end
