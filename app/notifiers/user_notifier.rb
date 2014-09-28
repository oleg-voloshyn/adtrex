class UserNotifier
  include Sidekiq::Worker

  sidekiq_options retry: false

  def perform(action, params = {})
    send(action, params)
  end

  def password_reset(params)
    user = User.find(params['user_id'])
    UserMailer.send(:password_reset, user).deliver
  end
end
