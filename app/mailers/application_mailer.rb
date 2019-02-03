# app/mailers/application_mailer.rb
class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@lunabase.xyz'
  layout 'mailer'
end
