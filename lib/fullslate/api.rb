module Fullslate
  class Api
    include HTTParty

    class << self
      def config_updated
        base_uri Fullslate.api_uri
      end

      def employees
        employees_array = Array.new

        get('/employees').each do |employee_json|
          employees_array << Fullslate::Employee.new(employee_json)
        end

        employees_array
      end

      def services
        services_array = Array.new

        get('/services').each do |services_json|
          services_array << Fullslate::Service.new(services_json)
        end

        services_array
      end

    end

  end
end

