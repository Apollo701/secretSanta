class UserMailer < ApplicationMailer
  default from: 'secretSanta@secretsanta.com'
 
  def welcome_email(giver, receiver)
    @giver = giver
    @receiver = receiver
    @url  = 'http://example.com/login'
    mail(to: @giver.email, subject: 'Welcome to My Awesome Site')
  end
end
