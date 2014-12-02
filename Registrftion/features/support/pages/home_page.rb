class HomePage
  include PageObject
  link(:register, link: 'Register')
  def go_register_page
    self.register
  end

end