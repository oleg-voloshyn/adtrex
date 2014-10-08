require 'bcrypt'

namespace :create do
  task super_user: :environment do
    unless User.select(&:super_admin?).first
      puts 'SuperUser admin has been created'
      super_user = User.new(
        name: ENV["FIRST_NAME"],
        email: ENV["EMAIL"],
        password: ENV["PASSWORD"],
        token: SecureRandom.urlsafe_base64
      )
      super_user.save!(validate: false)
    end
  end
end
