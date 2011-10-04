class Query < ActiveRecord::Base
  after_create :send_notification_mail
  validates :email, :question, :presence => true

  def send_notification_mail
    Mailer.delay(:run_at => (Time.now + 5.seconds)).notification_email(self)
  end

end

