class UserMailer < ApplicationMailer
  default from: 'secretSanta@secretsanta.com'
 
  def welcome_email(giver, receiver)
    @giver = giver
    @receiver = receiver
    mail(to: @giver.email, subject: 'Welcome to Secret Santa')
  end
end
