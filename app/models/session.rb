class Session
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :email, :password

  delegate :id, to: :user, prefix: true

  validates :email, :password, presence: true
  validate :credentials

  def initialize(attrs = {})
    attrs ||= {}
    attrs.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  def user
    @user ||= User.find_by_email(email)
  end

  private

  def credentials
    unless password.blank?
      if user.nil?
        errors.add(:email, :invalid)
      elsif !user.confirmed?
        errors.add(:email, :confirm)
      elsif !user.authenticate(password)
        errors.add(:email, :invalid)
      end
    end
  end
end
