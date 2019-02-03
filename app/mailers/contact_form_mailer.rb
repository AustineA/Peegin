class ContactFormMailer < ApplicationMailer

  def send_form(contact)
    @contact = contact
    mail(to: 'contact@lunabase.xyz', subject: @contact.interest)
  end


end
