require 'httparty'
require 'active_support'
require 'ri_cal'
require 'tzinfo'

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

    def verify_ssl?
      !(configuration.verify_ssl == false)
    end

    def api_uri
      "https://#{key}.fullslate.com/api"
    end

    def url_params
      { auth: auth_key, app: token }
    end
  end
end

require 'fullslate/api'
require 'fullslate/version'
require 'fullslate/errors'
require 'fullslate/configuration'
require 'fullslate/employee'
require 'fullslate/service'
require 'fullslate/client'
require 'fullslate/event'

