class UserMailer < ActionMailer::Base
  default from: "lord.voloshyn@gmail.com"

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Adtrex Notification"
  end
end
