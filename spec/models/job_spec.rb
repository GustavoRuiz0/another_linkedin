require 'rails_helper'

RSpec.describe Job, type: :model do
  let(:job) { FactoryBot.build(:job) }

  subject { job }

  context 'is valid' do
    it 'should be valid a job with all fields' do
      expect(job).to be_valid
    end
  end

  context 'no valid because nil attributes' do
    it 'is not valid without a type' do
      subject.type = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a description' do
      subject.description = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a salary' do
      subject.salary = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a location' do
      subject.location = nil
      expect(subject).to_not be_valid
    end
  end

  context 'is not valid because attributes so long' do
    it 'is not valid if type is too long' do
      subject.type = 'E' * 31
      expect(subject).to_not be_valid
    end

    it 'is not valid if title is too long' do
      subject.title = 'S' * 61
      expect(subject).to_not be_valid
    end

    it 'is not valid if description is too long' do
      subject.description = 'D' * 501
      expect(subject).to_not be_valid
    end

    it 'is not valid if location is too long' do
      subject.location = 'L' * 51
      expect(subject).to_not be_valid
    end
  end

  context 'is not valid because so long attributes' do
    it 'is not valid if type is too short' do
      subject.type = 'En'
      expect(subject).to_not be_valid
    end

    it 'is not valid if title is too short' do
      subject.title = 'Software'
      expect(subject).to_not be_valid
    end

    it 'is not valid if description is too short' do
      subject.description = 'D' * 29
      expect(subject).to_not be_valid
    end
  end
end
