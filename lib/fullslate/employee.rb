module Fullslate

  class Employee
    API_PATH = '/employees'
    attr_reader :id, :first_name, :last_name

    #TODO implement low level (id and name only), then full call when necessary

    def initialize(params)
      @id = params["id"]
      @first_name = params["first_name"]
      @last_name = params["last_name"]

      if @id.nil?
        raise Fullslate::EmployeeNotFound
      end
    end

    def name
      "#{first_name} #{last_name}"
    end
  end

end
