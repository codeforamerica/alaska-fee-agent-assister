# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin
    before_action :default_params

    def authenticate_admin
      authenticate_or_request_with_http_basic do |username, password|
        username == CredentialsHelper.basic_auth_username && password == CredentialsHelper.basic_auth_password
      end
    end

    def default_params
      resource_params = params.fetch(resource_name, {})
      order = resource_params.fetch(:order, "created_at")
      direction = resource_params.fetch(:direction, "desc")
      params[resource_name] = resource_params.merge(order: order, direction: direction)
    end
  end
end
