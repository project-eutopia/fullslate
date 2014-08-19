require 'spec_helper'

describe Fullslate::Api do

  describe '#events' do
    subject(:events) { Fullslate::Api.events }

    it 'should have some events' do
      expect(events).not_to be_empty
      expect(events[0]).to be_an_instance_of Fullslate::Event
    end

    context 'first element' do
      it 'should have a name that matches the employee name' do
        em = Fullslate::Api.employee(events[0].employee["id"])
        expect(events[0].employee["name"]).to eq "#{em.first_name} #{em.last_name}"
      end
    end
  end
end
