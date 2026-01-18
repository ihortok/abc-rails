module AdminAuthentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_admin
  end

  private

  def authenticate_admin
    authenticate_or_request_with_http_basic("Admin Dashboard") do |username, password|
      username_match = ActiveSupport::SecurityUtils.secure_compare(
        username.to_s,
        AdminConfig.username
      )

      password_match = ActiveSupport::SecurityUtils.secure_compare(
        password.to_s,
        AdminConfig.password
      )

      username_match && password_match
    end
  end
end
