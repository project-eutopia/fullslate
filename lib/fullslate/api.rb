module Fullslate
  class Api
    include HTTParty

    class << self
      def config_updated
        base_uri Fullslate.api_uri
      end

      # opts[:raw] = true => returns raw json string
      # opts[:query] = hash of query string parameters to add to url
      # opts[:ids] = array of ids to get in the call
      def employees(opts = {})
        fullslate_objects(Fullslate::Employee, opts)
      end

      def employee(id, opts = {})
        fullslate_object(id, Fullslate::Employee, opts)
      end

      def services(opts = {})
        fullslate_objects(Fullslate::Service, opts)
      end

      def service(id, opts = {})
        fullslate_object(id, Fullslate::Service, opts)
      end

      def clients(opts = {})
        opts[:query] = Hash.new unless opts[:query]
        # Always include extra data about clients by default
        opts[:query].merge!(
          { include: 'emails,phone_numbers,addresses,links' }
        )
        fullslate_objects(Fullslate::Client, opts)
      end

      def client(id, opts = {})
        fullslate_object(id, Fullslate::Client, opts)
      end

      def events(opts = {})
        fullslate_objects(Fullslate::Event, opts)
      end

      def event(id, opts = {})
        fullslate_object(id, Fullslate::Event, opts)
      end

      private

      def fullslate_objects(object_class, opts = {})
        array = Array.new

        res = get(object_class::API_PATH, query: query_from_opts(opts))
        return res if opts[:raw]

        res.each do |json|
          array << object_class.new(json)
        end

        if opts[:ids]
          new_array = Array.new
          array.each do |obj|
            new_array << obj if opts[:ids].include? obj.id
          end

          return new_array
        end

        array
      end

      def fullslate_object(id, object_class, opts = {})
        json = get("#{object_class::API_PATH}/#{id}", query: query_from_opts(opts))

        return json if opts[:raw]

        object_class.new(json)
      end

      def query_from_opts(opts)
        if opts[:query]
          Fullslate.url_params.merge(opts[:query])
        else
          Fullslate.url_params
        end
      end
    end
  end
end

