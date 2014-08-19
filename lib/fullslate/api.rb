module Fullslate
  class Api
    include HTTParty

    class << self
      def config_updated
        base_uri Fullslate.api_uri
      end

      def employees(opts = nil)
        employees_array = Array.new

        res = get('/employees', query: Fullslate.url_params)
        return res if opts and opts[:raw]

        res.each do |employee_json|
          employees_array << Fullslate::Employee.new(employee_json)
        end

        employees_array
      end

      def employee(id)
        json = get("/employees/#{id}", query: Fullslate.url_params)
        Fullslate::Employee.new(json)
      end

      def services(opts = nil)
        services_array = Array.new

        res = get('/services', query: Fullslate.url_params)
        return res if opts and opts[:raw]

        res.each do |service_json|
          services_array << Fullslate::Service.new(service_json)
        end

        services_array
      end

      def service(id)
        json = get("/services/#{id}", query: Fullslate.url_params)
        Fullslate::Service.new(json)
      end

      def clients(opts = nil)
        params = Fullslate.url_params.merge!(
          { include: 'emails,phone_numbers,addresses,links' }
        )
        clients_array = Array.new

        res = get('/clients', query: params)
        return res if opts and opts[:raw]

        res.each do |client_json|
          clients_array << Fullslate::Client.new(client_json)
        end

        clients_array
      end

      def client(id)
        json = get("/clients/#{id}", query: Fullslate.url_params)
        Fullslate::Client.new(json)
      end

      def events(opts = nil)
        events_array = Array.new

        res = get('/events', query: Fullslate.url_params)
        return res if opts and opts[:raw]

#        return res

        res.each do |event_json|
          events_array << Fullslate::Event.new(event_json)
        end

        events_array
      end

    end
  end
end

