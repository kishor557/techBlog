class Users::RegistrationsController < Devise::RegistrationsController
  def edit
    super
  end
  
  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)

    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      sign_in resource_name, resource, bypass: true
      redirect_to root_path
    else
      render action: 'edit'
    end
  end
end
