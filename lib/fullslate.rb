require 'httparty'

module Fullslate
  class << self
    def configuration
      @configuration ||= Fullslate::Configuration.new
    end

    def configure
      return nil unless block_given?
      yield configuration

      # Process this configuration
      Fullslate::Api.config_updated
    end

    def key
      configuration.key
    end

    def token
      configuration.token
    end

    def auth_key
      configuration.auth_key
    end

    def api_uri
      "https://#{token}.fullslate.com/api"
    end

    def url_params
      { auth: auth_key, token: token }
    end
  end
end

require 'fullslate/api'
require 'fullslate/version'
require 'fullslate/configuration'
require 'fullslate/employee'

