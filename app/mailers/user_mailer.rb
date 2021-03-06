class UserMailer < ActionMailer::Base
  default from: "duchiep.ap@gmail.com"
  def active_Key_mail(user)
    @user = user
    mail(to: @user.email, subject: 'Active Account')
  end

  def contact_mail(contact)
    @contact = contact
    mail(to: @contact.email, subject: 'Thank for your feedback.')
  end
end
