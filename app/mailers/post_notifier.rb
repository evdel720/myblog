class PostNotifier < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_notifier.new_post.subject
  #
  def new_post(post, user)
    @post = post
    mail to: user.email, subject: "New post in my blog, " + post.title
  end
end
