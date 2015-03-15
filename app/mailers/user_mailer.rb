class UserMailer < ActionMailer::Base
  default from: "customercare@videoclubhn.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to Video Club")
  end

  def confirm_stream(stream)
  	@user = stream.user
  	@stream = stream
    mail(to: @user.email, subject: "Confirm Stream")
  end

end