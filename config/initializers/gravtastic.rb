# http://github.com/chrislloyd/gravtastic/issues/closed/#issue/12
module Gravtastic
  module InstanceMethods
    alias_method :origin_gravatar_url, :gravatar_url
    def gravatar_url(options={})
      origin_gravatar_url(options).html_safe
    end
  end
end