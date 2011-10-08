class Mailer < ActionMailer::Base
  default from: "info@wesearchwell.com", bcc: "kalpesh.fulpagare@gmail.com"

  def notification_email(user)
    @user = user
    mail(:to => user.email, :subject => "Welcome to We Search Well")
  end

  def solution_email(query)
    @query = query
    mail(:to => query.email, :subject => "Welcome to We Search Well")
  end

end

