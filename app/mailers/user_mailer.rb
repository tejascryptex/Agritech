class UserMailer < ApplicationMailer

  

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Agritech')
  end

 
  def password_reset(user)
    @user = user
    @reset_url = edit_password_reset_url(@user.reset_password_token)
    mail(to: @user.email, subject: 'Reset your password')
  end



  # def reset_email
  #   @user = params[:user]
  #   @reset_url = edit_password_reset_url(token: @user.reset_password_token)
  #   mail(to: @user.email, subject: 'Password Reset Instructions')
  # end
  
end
