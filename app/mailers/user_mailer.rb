class UserMailer < ApplicationMailer
  default from: 'secretSanta@secretsanta.com'
 
  def welcome_email(giver, receiver, price_limit)
    @giver = giver
    @receiver = receiver
    @price_limit = price_limit
    mail(to: @giver.email, subject: 'Welcome to Secret Santa')
  end
end
