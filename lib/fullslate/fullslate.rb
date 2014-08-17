module Fullslate
  class Api
    include HTTParty

    def config_updated
      base_uri Fullslate.api_uri
    end
  end
end

