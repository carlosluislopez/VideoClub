class UserMailer < ActionMailer::Base
  default from: "customercare@videoclubhn.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to Video Club")
  end
end