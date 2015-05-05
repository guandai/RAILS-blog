include ApplicationHelper
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  private
  
  before_filter :ensure_user_loggedin
  #p request  is not working here  
  def ensure_user_loggedin
    #p  request
    #p #request.original_url
    test1 = !request.fullpath =~ /login/
    test2 = request.fullpath == "/"
    test3 = !request.fullpath =~ /session/
    test4 =  session[:user_id].nil? 
    if  test1 && test2 && test3 && test4
        redirect_to '/'
    end

  end

  def current_user
    User.where(id: session[:user_id]).first
  end
  helper_method :current_user
end