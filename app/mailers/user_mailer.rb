class UserMailer < ActionMailer::Base
  default from: "lord.voloshyn@gmail.com"

  def password_reset(user, reset_password)
    @user = user
    @reset_token = reset_password
    mail to: user.email, subject: "Adtrex Notification"
  end
end
