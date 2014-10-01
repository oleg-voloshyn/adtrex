class UserMailer < ActionMailer::Base
  default from: "mail.adtrex@gmail.com"

  def password_reset(user, password_reset)
    @user = user
    mail to: user.email, subject: "Adtrex Notification"
  end
end
