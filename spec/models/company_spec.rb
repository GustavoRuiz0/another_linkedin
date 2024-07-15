# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:company) { FactoryBot.build(:company) }

  subject { company }

  context 'is valid' do
    it 'should be valid' do
      expect(company).to be_valid
    end
  end

  context 'no valid' do
    context 'no valid because null fields' do
      it 'no valid because null name' do
        company.name = nil
        expect(company).to_not be_valid
      end

      it 'no valid because null description' do
        company.description = nil
        expect(company).to_not be_valid
      end

      it 'no valid because null contact_email' do
        company.contact_email = nil
        expect(company).to_not be_valid
      end

      it 'no valid because null contact_phone' do
        company.contact_phone = nil
        expect(company).to_not be_valid
      end
    end

    context 'no valid because so long fields' do
      it 'no valid because name so long' do
        company.name = 'n' * 51
        expect(company).to_not be_valid
      end

      it 'no valid because description so long' do
        company.description = 'ndada' * 501
        expect(company).to_not be_valid
      end

      it 'no valid because contact_email so long' do
        company.contact_email = 'valid@email.com' * 51
        expect(company).to_not be_valid
      end

      it 'no valid because contact_phone so long' do
        company.contact_phone = '9' * 17
        expect(company).to_not be_valid
      end
    end

    context 'no valid so short fields' do
      it 'no valid because name so short' do
        company.name = 'n'
        expect(company).to_not be_valid
      end

      it 'no valid because description so short' do
        company.description = 'n' * 9
        expect(company).to_not be_valid
      end

      it 'no valid because contact_email so short' do
        company.contact_email = 'valid@email.com' * 7
        expect(company).to_not be_valid
      end

      it 'no valid because contact_phone so short' do
        company.contact_phone = '9' * 7
        expect(company).to_not be_valid
      end
    end

    context 'no valid because dont respond to field regex validation' do
      it 'dont respond email format' do
        company.contact_email = 'novalidbatata'
        expect(company).to_not be_valid
      end
    end
  end
end