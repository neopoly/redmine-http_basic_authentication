require "http_basic_authentication/patches"

module HttpBasicAuthentication
  # Registers this gems a Redmine plugin and applies the needed patches
  class RedminePlugin
    include HttpBasicAuthentication::Infos

    def initialize
      register!
      boot!
    end

    private

    def register!
      Redmine::Plugin.register :http_basic_authentication do
        name NAME
        author AUTHORS.keys.join(", ")
        description DESCRIPTION
        version VERSION
        url URL
        author_url URL

        settings default: { "email_suffix" => "@neopoly.de" },
                 partial: "http_basic_authentication/settings"
      end
    end

    def boot!
      Patches.apply!
    end
  end
end
