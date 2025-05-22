class User < ApplicationRecord


  has_secure_password
  has_many :listings, dependent: :destroy
  has_many :crops, dependent: :destroy

  has_one_attached :photo


  # Reset Password
  def generate_password_reset_token!
    update!(
      reset_password_token: SecureRandom.urlsafe_base64,
      reset_password_sent_at: Time.current
    )
  end

  def password_reset_token_valid?
    reset_password_sent_at && reset_password_sent_at > 2.hours.ago
  end

  def reset_password!(new_password)
    update!(
      reset_password_token: nil,
      password: new_password
    )
  end
  
  

end
