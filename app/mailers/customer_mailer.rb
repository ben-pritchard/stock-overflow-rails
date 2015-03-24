class CustomerMailer < ApplicationMailer
  default from: "santa@northpole.com"

  def send_welcome_message(user)
    @user = user
    @greeting = "You've been naughty this year."

    mail to: user.email
  end
end
