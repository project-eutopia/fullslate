require 'spec_helper'

describe Fullslate::Api do

  describe '#clients' do
    subject(:clients) { Fullslate::Api.clients }

    it 'should have some clients' do
      expect(clients).not_to be_empty
      #expect(services.size).to eq 4
    end

    it 'should have non-nil data' do
      first_name = clients[0].first_name
      expect(first_name).to be_an_instance_of String
      expect(first_name).not_to eq ""
    end
  end

  describe '#client(:id)' do
    let(:client) { Fullslate::Api.client(client_id) }

    shared_examples 'has id, first_name, and last_name' do
      it 'should have id' do
        expect(client.id).to be_a_kind_of Integer
      end
      it 'should have first and last name' do
        expect(client.first_name).to be_an_instance_of String
        expect(client.last_name).to be_an_instance_of String
        expect(client.first_name).not_to eq ""
        expect(client.last_name).not_to eq ""
      end
    end

    context 'available id' do
      context 'one email present' do
        let(:client_id) { 25 }
        include_examples 'has id, first_name, and last_name'

        it 'has one email' do
          expect(client.emails.size).to eq 1
          expect(client.emails[0]).to eq 'smitha@fakeemail.com'
          expect(client.phone_numbers.size).to eq 0
        end
      end

      context 'no emails/phone_numbers' do
        let(:client_id) { 29 }
        include_examples 'has id, first_name, and last_name'

        it 'has no emails or phone_numbers' do
          expect(client.emails.size).to eq 0
          expect(client.phone_numbers.size).to eq 0
        end
      end

      context 'has emails and phone_numbers' do
        let(:client_id) { 126 }
        include_examples 'has id, first_name, and last_name'

        it 'has email' do
          expect(client.emails.size).to eq 1
          expect(client.emails[0]).to eq 'evafra@notanemail.com'
        end

        it 'has phone_number' do
          expect(client.phone_numbers.size).to eq 1
          expect(client.phone_numbers[0]).to eq '09099999999'
        end
      end

      context 'unicode in first name' do
        let(:client_id) { 31 }
        include_examples 'has id, first_name, and last_name'
      end

      context 'no active variable' do
        let(:client_id) { 61 }
        include_examples 'has id, first_name, and last_name'

        it 'active is false' do
          expect(client.active).to be false
        end
      end

      context 'unicode in time_zone' do
        let(:client_id) { 159 }
        include_examples 'has id, first_name, and last_name'
      end

      context 'unicode in notes' do
        let(:client_id) { 201 }
        include_examples 'has id, first_name, and last_name'
      end

    end

    context 'unavailable id' do
      let(:client_id) { 123 }

      it 'should be throw ClientNotFound' do
        expect { client }.to raise_error(Fullslate::ClientNotFound)
      end
    end
  end
end
