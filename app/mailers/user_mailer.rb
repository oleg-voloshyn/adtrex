class UserMailer < ActionMailer::Base
  default from: "lord.voloshyn@gmail.com"

  def confirmation(user, token)
    @user = user
    @confirm_token = token
    mail to: user.email
  end

  def reset_password(user, token)
    @user = user
    @token = token
    mail to: user.email
  end
end
