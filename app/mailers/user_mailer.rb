class UserMailer < ApplicationMailer
  default from: 'notifications@odin-fakebook.com'

  def welcome_email
    @user = params[:user]
    @url =  'http://odin-fakebook.com/login'
    mail(to: @user.email, subject: 'Welcome to the one and only odin-fakebook!')
  end 
end
