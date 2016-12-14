class UserMailer < ApplicationMailer
  default from: 'my_email@hi.com'

  def welcome_email(user)
    @user = user
    @url = 'http://appacademy.io'
    mail(to: user.email, subject: 'hello')
  end
end
