class Query < ActiveRecord::Base
  after_create :send_notification_mail
  validates :question, :presence => true
  #validates_format_of :email, :with => /^(?=.*\d)(?=.*([a-z]|[A-Z]))([\x20-\x7E]){8,40}$/
  validates :email,
            :presence => true,
            :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

  def send_notification_mail
    Mailer.delay(:run_at => (Time.now + 5.seconds)).notification_email(self)
  end

end

