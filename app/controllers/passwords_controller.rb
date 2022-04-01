class PasswordsController < Devise::PasswordsController
  def create
    flash.now[:alert] = 'This functionality is disabled.  You would normally receive an email with reset instructions.'

    self.resource = resource_class.new
    render 'new'
  end
end