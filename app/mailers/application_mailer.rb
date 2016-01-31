class ApplicationMailer < ActionMailer::Base
  default from: Author.all[0].author + "author@example.com"
  layout 'mailer'
end
