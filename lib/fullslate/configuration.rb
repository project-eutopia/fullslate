module Fullslate
  class Configuration
    attr_accessor :key, :token, :auth_key

    def configured?
      key.present? and token.present? and auth_key.present?
    end
  end
end
