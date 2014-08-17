module Fullslate
  class Api
    include HTTParty

    def self.config_updated
      base_uri Fullslate.api_uri
    end
  end
end

