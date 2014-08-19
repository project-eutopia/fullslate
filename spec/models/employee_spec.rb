require 'spec_helper'

describe Fullslate::Api do

  describe '#employees' do
    subject(:employees) { Fullslate::Api.employees }

    it 'should have some employees' do
      expect(employees).not_to be_empty
      expect(employees.size).to eq 2
    end

    it 'should have non-nil data' do
      first_name = employees[0].first_name
      expect(first_name).to be_an_instance_of String
      expect(first_name).not_to eq ""
    end
  end

  describe '#employee(:id)' do
    let(:employee) { Fullslate::Api.employee(employee_id) }

    context 'available id' do
      let(:employee_id) { 55 }

      it 'should have name "Chris"' do
        expect(employee.first_name).to eq "Chris"
      end
    end

    context 'unavailable id' do
      let(:employee_id) { 123 }

      it 'should be throw EmployeeNotFound' do
        expect { employee }.to raise_error(Fullslate::EmployeeNotFound)
      end
    end
  end
end

