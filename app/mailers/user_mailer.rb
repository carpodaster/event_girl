class UserMailer < ActionMailer::Base
  default from: APP_CONFIG[:mail_from]

  default_url_options[:host] = APP_CONFIG[:host]

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @url = edit_password_reset_url(
      user.password_reset_token,
      protocol: APP_CONFIG[:url_scheme]
    )
    mail to: user.email, subject: "[event_girl] Password reset"
  end
end
