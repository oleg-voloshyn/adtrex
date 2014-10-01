class MailJob
  include SuckerPunch::Job

  def perform(mailer, method, object = nil, user = nil)
    mailer.send(method, object, user).deliver
  end
end
