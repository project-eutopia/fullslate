require 'spec_helper'

describe Fullslate::Employee do
  it "should pass" do
    expect(true).to be true
  end
end

describe 'External request' do
  it 'queries FactoryGirl contributors on Github' do
    uri = URI('https://api.github.com/repos/thoughtbot/factory_girl/contributors')

    response = Net::HTTP.get(uri)

    expect(response).to be_an_instance_of(String)
  end
end
