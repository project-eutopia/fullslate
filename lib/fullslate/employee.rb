module Fullslate

  class Employee
    attr_accessor :id, :first_name, :last_name

    def initialize(params)
      @id = params["id"]
      @first_name = params["first_name"]
      @last_name = params["last_name"]
    end
  end

end
