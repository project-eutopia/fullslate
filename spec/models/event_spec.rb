require 'spec_helper'

describe Fullslate::Api do

  describe '#events' do
    subject(:events) { Fullslate::Api.events }

    it 'should have some events' do
      expect(events).not_to be_empty
      expect(events[0]).to be_an_instance_of Fullslate::Event
    end

    context 'simple event' do
      subject(:event) { Fullslate::Api.event('Nqz9qOnOR3') }

      it 'should have a name that matches the employee name' do
        em = Fullslate::Api.employee(event.employee["id"])
        expect(event.employee["name"]).to eq "#{em.first_name} #{em.last_name}"
      end

      it 'should have proper recurrence' do
        expect(event.occurrences(before: Time.new(2014, 8, 17)).size).to eq 0
        expect(event.occurrences(before: Time.new(2014, 8, 18)).size).to eq 1
        expect(event.occurrences(before: Time.new(2014, 8, 25)).size).to eq 2
        e = event.occurrences(before: Time.new(2014, 8, 25))
      end

      it 'should have correct type' do
        expect(event.type).to eq :class
      end
    end
  end
end
