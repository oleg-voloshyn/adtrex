ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "adtrex.com.ua",
  :user_name            => ENV['EMAIL'],
  :password             => ENV['PASSWORD'],
  :authentication       => "plain",
  :enable_starttls_auto => true
}
