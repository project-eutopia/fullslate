require 'sinatra/base'

class FakeFullslate < Sinatra::Base

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

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end
