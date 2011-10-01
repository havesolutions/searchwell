class Query < ActiveRecord::Base
  after_create :send_notification_mail
  validates :user_name, :email, :question, :presence => true

  def send_notification_mail
    Mailer.delay(:run_at => (Time.now + 30.seconds)).notification_email(self)
  end

end

