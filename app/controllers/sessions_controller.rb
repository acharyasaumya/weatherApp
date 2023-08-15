class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])

    if user.nil?
      handle_error('User not found')
      return
    end

    if authenticate(user)
      sign_in(user)
      redirect_to new_weather_path
    else
      handle_error('Invalid password')
    end
  rescue StandardError => e
    handle_error(e.message)
  end

  def destroy
    sign_out
    redirect_to new_session_path
  rescue StandardError => e
    handle_error(e.message, redirect_to: new_session_path)
  end

  private

  def authenticate(user)
    user.password == Digest::SHA256.hexdigest(params[:password])
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session[:user_id] = nil
  end

  def handle_error(message, redirect_to: :new)
    flash[:error] = message
    render redirect_to
  end
end
