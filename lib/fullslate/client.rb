module Fullslate

  class Client
    API_PATH = '/clients'
    attr_reader :id, :first_name, :last_name, :notes, :emails, :phone_numbers, :addresses, :active

    def initialize(params)
      @id = params["id"]
      @first_name = params["first_name"]
      @last_name = params["last_name"]
      @notes = params["notes"]

      if params["emails"]
        @emails = params["emails"].map do |email_obj|
          email_obj["address"]
        end
      else
        @emails = Array.new
      end

      if params["phone_numbers"]
        @phone_numbers = params["phone_numbers"].map do |phone_number_obj|
          phone_number_obj["number"]
        end
      else
        @phone_numbers = Array.new
      end

      if params["addresses"]
        @addresses = params["addresses"].map do |address_obj|
          address_obj["number"]
        end
      else
        @addresses = Array.new
      end

      @active = (params["active"] == true)

      if @id.nil?
        raise Fullslate::ClientNotFound
      end
    end

    def name
      "#{first_name} #{last_name}"
    end
  end

end
