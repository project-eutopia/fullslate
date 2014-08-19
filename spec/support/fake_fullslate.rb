require 'sinatra/base'

class FakeFullslate < Sinatra::Base

  #
  # Fullslate::Employee API calls
  #
  get '/api/employees' do
    json_response 200, 'employees.json'
  end

  get '/api/employees/:id' do
    json = json_response 200, 'employees.json'

    employee = JSON.parse(json).find do |employee_json|
      employee_json["id"] == params[:id].to_i
    end

    employee.to_json
  end

  #
  # Fullslate::Service API calls
  #
  get '/api/services' do
    json_response 200, 'services.json'
  end

  get '/api/services/:id' do
    json = json_response 200, 'services.json'

    service = JSON.parse(json).find do |services_json|
      services_json["id"] == params[:id].to_i
    end

    service.to_json
  end

  #
  # Fullslate::Client API calls
  #
  get '/api/clients' do
    json_response 200, 'clients.json'
  end

  get '/api/clients/:id' do
    json = json_response 200, 'clients.json'

    client = JSON.parse(json).find do |clients_json|
      clients_json["id"] == params[:id].to_i
    end

    client.to_json
  end

  #
  # Fullslate::Event API calls
  #
  get '/api/events' do
    json_response 200, 'events.json'
  end

  get '/api/events/:id' do
    json = json_response 200, 'events.json'

    event = JSON.parse(json).find do |events_json|
      events_json["id"] == params[:id].to_i
    end

    event.to_json
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end
