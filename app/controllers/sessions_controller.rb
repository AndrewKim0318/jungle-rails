class SessionsController < ApplicationController
  def new
  end

  def create
  
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # success logic, log them in
      session[:user_id] = user.id
      redirect_to :root
    else
      # failure, render login form
      redirect_to new_session_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end
end
