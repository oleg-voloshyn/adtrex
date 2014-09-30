ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "adtrex.com.ua",
  :user_name            => 'mail.adtrex@gmail.com',
  :password             => 'adtrex12',
  :authentication       => "plain",
  :enable_starttls_auto => true
}
