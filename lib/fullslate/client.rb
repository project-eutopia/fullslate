module Fullslate

  class Client
    attr_accessor :id, :first_name, :last_name, :emails, :phone_numbers

    def initialize(params)
      @id = params["id"]
      @first_name = params["first_name"]
      @last_name = params["last_name"]

      if params["emails"]
        @emails = params["emails"].each do |email_obj|
          email_obj["address"]
        end
      else
        @emails = Array.new
      end

      if params["phone_numbers"]
        @phone_numbers = params["phone_numbers"].each do |phone_number_obj|
          phone_number_obj["phone_numbers"]
        end
      else
        @phone_numbers = Array.new
      end

      @active = (params["active"] == true)
    end
  end

end
