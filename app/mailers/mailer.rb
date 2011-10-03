class Mailer < ActionMailer::Base
  default from: "info@wesearchwell.com"

  def notification_email(user)
    @user = user
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end

end

