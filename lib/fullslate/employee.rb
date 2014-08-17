module Fullslate

  class Employee
    include HTTParty

    base_uri FullslateApi.api_uri

    def initialize()
      #@id = id
    end

    def user
      g = self.class.get("/employees", Fullslate.url_params)
      binding.pry
      g
    end
  end

end
