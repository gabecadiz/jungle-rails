class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    #if the user exists AND the password is correct
    if user && user.authenticate(params[:password])
      #save the user id inside the browser cookie. This is how week keep the user
      #logged in when they navigate around our website
      session[:user_id] = user.id
      redirect_to '/'
    else
    #if the user's login doesnt work, send them back to login form
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
