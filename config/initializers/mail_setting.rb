ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => "587",
  :domain => "gmail.com",
  :authentication => :plain,
  :user_name => "Enter Email Address here",
  :password => "Enter Password Here",
  :enable_starttls_auto => true
}

