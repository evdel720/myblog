class PostNotifier < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_notifier.new_post.subject
  #
  def new_post
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
