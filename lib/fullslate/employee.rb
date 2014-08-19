module Fullslate

  class Employee
    API_PATH = '/employees'
    attr_reader :id, :first_name, :last_name

    def initialize(params)
      @id = params["id"]
      @first_name = params["first_name"]
      @last_name = params["last_name"]

      if @id.nil?
        raise Fullslate::EmployeeNotFound
      end
    end
  end

end
