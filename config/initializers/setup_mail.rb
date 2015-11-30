   ActionMailer::Base.delivery_method = :smtp
   ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => "25",
  :domain               => "gmail.com",
  :user_name            => "msg.demo123@gmail.com",
  :password             => "12341234nt",
  :authentication       => :plain,
  :enable_starttls_auto => true
}