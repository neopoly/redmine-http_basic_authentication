module HttpBasicAuthentication
  # Module to share global gem / plugin information between
  # the gem's specification and the Redmine plugin specification
  module Infos
    NAME        = "redmine-http_basic_authentication"
    DESCRIPTION = "Use HTTP Basic Authentication for login and" \
                  " IMPLICIT registration!"
    LICENSE     = "MIT"
    URL         = "https://github.com/neopoly/redmine-http_basic_authentication"
    AUTHORS     = {
      "Jonas Thiel" => "jt@neopoly.de"
    }.freeze
  end
end
