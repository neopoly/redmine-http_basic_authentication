module HttpBasicAuthentication
  module Patches
    # This module patches the default authentication system
    # by using HTTP Basic Authorization headers fields to login
    # users or create them if necessary.
    module ApplicationControllerPatch
      extend ActiveSupport::Concern

      included do
        alias_method_chain :try_to_autologin, :http_basic
      end

      # We hijack the autologin method as this the HTTP Basic authorization
      # is a kind of auto login system which created users on the fly.
      def try_to_autologin_with_http_basic
        if http_authorization?
          authenticate_with_http_basic do |username, _password|
            logger.info "Successful authentication for '#{username}'" \
              "from #{request.remote_ip} at #{Time.now.utc}"
            self.logged_user = User.find_by_login(username) ||
              create_http_authorization_user(username)
          end
        else
          try_to_autologin_without_http_basic
        end
      end

      private

      def http_authorization?
        request.authorization.present?
      end

      def create_http_authorization_user(username)
        email = "#{username}#{email_suffix}"
        user = User.new(mail: email, firstname: username, lastname: username)
        user.login = username
        user.save!
      end

      def email_suffix
        Setting.plugin_http_basic_authorization["email_suffix"]
      end
    end
  end
end
