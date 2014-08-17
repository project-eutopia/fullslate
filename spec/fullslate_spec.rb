require 'spec_helper'

describe Fullslate do
  describe "#config" do
    it "should have key" do
      expect(Fullslate.key).to eq "fakecompany"
    end

    it "should have auth_key" do
      expect(Fullslate.auth_key).to eq "ABCxyz123456"
    end
  end
end
