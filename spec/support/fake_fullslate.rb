require 'sinatra/base'

class FakeFullslate < Sinatra::Base

  # Generate the routing for each type of API call
  ['employees', 'services', 'clients', 'events'].each do |str|

    get "/api/#{str}" do
      objects_call(str, params)
    end

    get "/api/#{str}/:id" do
      object_call(str, params)
    end

  end

  private

  def objects_call(name, params)
    json_response 200, "#{name}.json"
  end

  def object_call(name, params)
    json = json_response 200, "#{name}.json"

    obj = JSON.parse(json).find do |cur_json|
      cur_json["id"].to_s == params[:id].to_s
    end

    obj.to_json
  end

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end
