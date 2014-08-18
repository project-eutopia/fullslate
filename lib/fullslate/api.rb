module Fullslate
  class Api
    include HTTParty

    class << self
      def config_updated
        base_uri Fullslate.api_uri
      end

      def employees
        employees_array = Array.new

        get('/employees', query: Fullslate.url_params).each do |employee_json|
          employees_array << Fullslate::Employee.new(employee_json)
        end

        employees_array
      end

      def employee(id)
        json = get("/employees/#{id}", query: Fullslate.url_params)
        Fullslate::Employee.new(json)
      end

      def services
        services_array = Array.new

        get('/services', query: Fullslate.url_params).each do |services_json|
          services_array << Fullslate::Service.new(services_json)
        end

        services_array
      end

      def service(id)
        json = get("/services/#{id}", query: Fullslate.url_params)
        Fullslate::Service.new(json)
      end

      def clients(opts = nil)
        params = Fullslate.url_params.merge!( { include: 'emails,phone_numbers,addresses,links' } )
        clients_array = Array.new

        res = get('/clients', query: params)
        return res if opts and opts[:raw]

        res.each do |clients_json|
          clients_array << Fullslate::Client.new(clients_json)
        end

        clients_array
      end

      def client(id)
        json = get("/clients/#{id}", query: Fullslate.url_params)
        Fullslate::Client.new(json)
      end

    end
  end
end

