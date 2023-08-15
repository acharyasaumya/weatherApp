class UsersController < ApplicationController
  def new
    @user = User.new
  rescue => e
    log_error(e)
    redirect_to root_path, alert: 'An error occurred while initializing user registration.'
  end

  def create
    @user = User.new(user_params_with_encrypted_password)
    if @user.save
      sign_in(@user)
      redirect_to new_weather_path
    else
      render :new
    end
  rescue => e
    log_error(e)
    redirect_to root_path, alert: 'An error occurred while creating the user account. Please try again.'
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def user_params_with_encrypted_password
    user_params.merge(password: encrypted_password)
  end

  def encrypted_password
    Digest::SHA256.hexdigest(user_params[:password])
  rescue => e
    log_error(e)
    raise 'An error occurred while encrypting the password.'
  end

  def sign_in(user)
    session[:user_id] = user.id
  rescue => e
    log_error(e)
    raise 'An error occurred while signing in the user.'
  end

  def log_error(e)
    Rails.logger.error e.message
    Rails.logger.error e.backtrace.join("\n")
  end
end
