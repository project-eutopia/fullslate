module Fullslate

  class Service
    attr_accessor :id, :name, :price, :time

    def initialize(params)
      @id = params["id"]
      @name = params["name"]
      @price = params["price"]
      @time = params["time"]
    end
  end

end
