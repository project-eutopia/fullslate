require 'spec_helper'

describe Fullslate do
  describe '#config' do
    it 'should have key' do
      expect(Fullslate.key).to eq 'fakecompany'
    end

    it 'should have token' do
      expect(Fullslate.token).to eq 'fakecompany'
    end

    it 'should have auth_key' do
      expect(Fullslate.auth_key).to eq 'ABCxyz123456'
    end
  end

  describe '#api_uri' do
    it 'should match expectation' do
      expect(Fullslate.api_uri).to eq 'https://fakecompany.fullslate.com/api'
    end
  end

  describe '#url_params' do
    it 'should have auth key' do
      expect(Fullslate.url_params[:auth]).to eq Fullslate.auth_key
    end

    it 'should have app token' do
      expect(Fullslate.url_params[:app]).to eq Fullslate.token
    end
  end

end
