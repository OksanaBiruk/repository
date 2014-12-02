class RegistrationPage
  include PageObject
  text_field(:login, id:'user_login')
  text_field(:password, id:'user_password')
  text_field(:confirm_password, id:'user_password_confirmation')
  text_field(:first_name, id:'user_firstname')
  text_field(:last_name, id:'user_lastname')
  text_field(:email, id:'user_mail')
  button(:commit, name:'commit')
  def register (login)
    self.login = login
    self.password = 'qwerty'
    self.confirm_password = 'qwerty'
    self.first_name = 'firstname'
    self.last_name = 'lastname'
    self.email = login+'@user.org'
    self.commit
  end
end