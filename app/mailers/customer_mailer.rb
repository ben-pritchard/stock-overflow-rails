class CustomerMailer < ApplicationMailer
  default from: "santa@northpole.com"

  def send_welcome_message(user)
    @user = user
    @greeting = "You've been naughty this year."

    mail to: user.email
  end

  def send_user_answer_notification(user)
    @user = user
    @greeting = "Someone answered your question!"

    mail to: user.email
  end
end
