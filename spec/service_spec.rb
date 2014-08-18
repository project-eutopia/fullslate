require 'spec_helper'

describe Fullslate::Api do

  describe '#services' do
    subject(:services) { Fullslate::Api.services }

    it 'should have some services' do
      expect(services).not_to be_empty
      expect(services.size).to eq 4
    end

    it 'should have non-nil data' do
      name = services[0].name
      expect(name).to be_an_instance_of String
      expect(name).not_to eq ""
    end
  end

  describe '#service(:id)' do
    let(:service) { Fullslate::Api.service(service_id) }

    context 'available id' do
      context 'price and time present' do
        let(:service_id) { 1 }

        it 'should have correct data' do
          expect(service.name).to eq "Diagnostics / Consultation"
          expect(service.price).to eq 0.0
          expect(service.time).to eq 3600
        end
      end

      context 'price and time null' do
        let(:service_id) { 276 }

        it 'should have correct data' do
          expect(service.price).to be_nil
          expect(service.time).to be_nil
        end
      end
    end

    context 'unavailable id' do
      let(:service_id) { 123 }

      it 'should be throw ServiceNotFound' do
        expect { service }.to raise_error(Fullslate::ServiceNotFound)
      end
    end
  end
end
