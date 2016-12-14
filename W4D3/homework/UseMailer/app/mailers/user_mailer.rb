class UserMailer < ApplicationMailer
  default from: 'bnakonehnuy@mail.ru'

  def welcome_email(user)
    @user = user
    @url = 'bohdan0.github.io'
    mail(to: user.email, subject: 'Welcome to My Awesome Game')
  end

end
