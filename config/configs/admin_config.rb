# frozen_string_literal: true

class AdminConfig < ApplicationConfig
  config_name :admin

  attr_config username: "admin"
  attr_config password: "password"
end
