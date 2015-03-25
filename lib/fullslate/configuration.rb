module Fullslate
  class Configuration
    attr_accessor :key, :token, :auth_key, :verify_ssl

    def configured?
      key.present? and token.present? and auth_key.present?
    end
  end
end
