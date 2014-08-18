module Fullslate

  class Service
    attr_reader :id, :name, :price, :time, :description

    def initialize(params)
      @id = params["id"]
      @name = params["name"]
      @price = params["price"]
      @time = params["time"]
      @description = params["description"]

      if @id.nil?
        raise Fullslate::ServiceNotFound
      end
    end
  end

end
