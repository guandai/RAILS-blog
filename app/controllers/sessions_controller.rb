class SessionsController < ApplicationController
  def new

  end

  def create
    @user = user = User.find_by_email(params[:email])
    
    if user && user.authenticate(params[:password])
      p "Log in User id is " + @user.id.to_s
      session[:user_id] = user.id
      
     # session[:user] = User.find(user.id)
     # p session[:user]
      redirect_to "/articles", notice: 'Logged in!'
    else
      render :new
    end
  end

  def destroy
    p "Log out User id is " + session[:user_id].to_s
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end
