class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user
      @user.generate_password_reset_token!
      UserMailer.password_reset(@user).deliver_later
      redirect_to root_path, notice: 'Check your email for reset instructions.'
    else
      redirect_to session_path, notice: 'Email not found.'
      
    end
  end

  def edit
    @user = User.find_by(reset_password_token: params[:id])

    if @user.nil? || !@user.password_reset_token_valid?
      redirect_to new_password_reset_path, notice: 'Password reset link is invalid or expired.'
    end
  end

  def update
    @user = User.find_by(reset_password_token: params[:id])

    if @user && @user.password_reset_token_valid?
      if @user.reset_password!(params[:user][:password])
        redirect_to session_path, notice: 'Password has been reset.'
      else
        notice:'Failed to reset password.'
        render :edit
      end
    else
      redirect_to new_password_reset_path, notice: 'Invalid or expired token.'
    end
  end
end
