class Query < ActiveRecord::Base

  validates :question, :presence => true
  validates :email,
            :presence => true,
            :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

  after_create :send_notification_mail
  before_save :set_is_solved

  def resolved
    is_solved ? "Yes" : "No"
  end

  def is_editable?
    !is_solved
  end

  def deliver_solution_email
    Mailer.delay(:run_at => (Time.now + 5.seconds)).solution_email(self) unless solution.blank?
#    Mailer.solution_email(self).deliver unless solution.blank?
    update_attribute(:mail_sent, true)
  end

  private
  def send_notification_mail
    Mailer.delay(:run_at => (Time.now + 5.seconds)).notification_email(self)
  end

  def set_is_solved
    unless solution.blank?
      self.is_solved = true
      self.solved_at = Time.now
      self.solved_by = AdminUser.current_user.id
    end
  end

end

