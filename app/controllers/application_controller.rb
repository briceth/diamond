class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

    class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,        keys: [:photos])
      devise_parameter_sanitizer.permit(:account_update, keys: [:photos])
    end
  end
end
