class UserMailer < ActionMailer::Base
default from: 'soojin.cho@bfa.com'
  def welcome_email(user)
    @user = user
    @url  = 'https://salty-headland-4058.herokuapp.com/'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
