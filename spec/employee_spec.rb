require 'spec_helper'

describe Fullslate::Employee do
  it "should pass" do
    expect(true).to be true
  end

  context "get" do
    stub_request(:get, "http://fakecompany.fullslate.com/api/employees").with(
      body: "hi"
    )

    it "should get" do
      Net::HTTP.get("http://fakecompany.fullslate.com/api/employees")
    end
  end

end
