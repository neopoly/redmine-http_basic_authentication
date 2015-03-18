require "http_basic_authentication/redmine_plugin"

module HttpBasicAuthentication
  # Simple engine to support the Redmine plugin
  class Engine < ::Rails::Engine
    config.to_prepare do
      RedminePlugin.new
    end
  end
end
