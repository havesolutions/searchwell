class Query < ActiveRecord::Base

  validates :question, :presence => true
  validates :email,
            :presence => true,
            :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

  after_create :send_notification_mail
  before_save :set_is_solved
  #after_update :send_email_with_solution

  def resolved
    is_solved ? "Yes" : "No"
  end

  def is_editable?
    !is_solved
  end

  private
  def send_notification_mail
    Mailer.delay(:run_at => (Time.now + 5.seconds)).notification_email(self)
  end

  def set_is_solved
    self.is_solved = !solution.blank?
  end

  def send_email_with_solution
    # Send email if Solution is not blank?
  end

end

