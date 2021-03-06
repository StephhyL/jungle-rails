class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by_email(params[:email].downcase.strip)

    # raise User.authenticate_with_credentials(params[:email], params[:password])
    #         .inspect

    # If the user exists AND the password entered is correct.
    # if user && user.authenticate(params[:password])
    if user =
         User.authenticate_with_credentials(params[:email], params[:password])
      # save the user id inside the browser cookie. This is how we keep the user logged in when they navigate around our website
      session[:user_id] = user.id
      redirect_to '/'
    else
      # if user's login doesn't work, send them back to the login form
      redirect_to '/login', notice: 'Invalid credentials. Please try again!'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
