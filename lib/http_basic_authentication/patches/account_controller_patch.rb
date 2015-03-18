module HttpBasicAuthentication
  module Patches
    # This module overwrites the default behavior of the AccountController
    # by disabling most of its methods as they make no sense in combination
    # with the implicit user generation used by this plugin
    module AccountControllerPatch
      extend ActiveSupport::Concern

      included do
        alias_method_chain :login, :http_basic
        alias_method_chain :logout, :http_basic
        alias_method_chain :lost_password, :http_basic
        alias_method_chain :register, :http_basic
        alias_method_chain :activate, :http_basic
        alias_method_chain :activation_email, :http_basic
      end

      def login_with_http_basic
        not_available!
      end

      # If the user was fully logged in only present a simple text
      # stating to logout by closing the browser
      def logout_with_http_basic
        if User.current.anonymous?
          redirect_to home_url
        elsif request.post?
          render "http_basic_authentication/logout"
        end
      end

      def lost_password_with_http_basic
        not_available!
      end

      def register_with_http_basic
        not_available!
      end

      def activate_with_http_basic
        not_available!
      end

      def activation_email_with_http_basic
        not_available!
      end

      private

      def not_available!
        render text: "Method Not Allowed", status: 405
      end
    end
  end
end
