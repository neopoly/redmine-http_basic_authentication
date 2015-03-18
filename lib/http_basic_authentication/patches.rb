require "http_basic_authentication/patches/application_controller_patch"
require "http_basic_authentication/patches/account_controller_patch"

module HttpBasicAuthentication
  # This module holds all patches of a default Redmine application
  module Patches
    # Apply all patches
    def self.apply!
      apply_to(::ApplicationController, ApplicationControllerPatch)
      apply_to(::AccountController, AccountControllerPatch)
    end

    private

    def self.apply_to(target, mod)
      target.send(:include, mod)
    end
  end
end
