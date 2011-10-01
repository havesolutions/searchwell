class Mailer < ActionMailer::Base
  default from: "from@example.com"

  def notification_email(user)
    @user = user
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end

end

