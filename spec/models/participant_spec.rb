require 'spec_helper'

describe Participant do
  EXCEEDING_LENGTH = 51
  before { @participant = Participant.new(first_name: "Johnny", last_name: 'Smith', country_code: 'United States', email: 'user@example.com') }

  subject { @participant }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:country_code) }

  it { should be_valid }

  describe 'when first name is not present' do
    before { @participant.first_name = ' ' }
    it { should_not be_valid }
  end

  describe 'when last name is not present' do
    before { @participant.last_name = ' ' }
    it { should_not be_valid }
  end

  describe 'when first name is too long' do
    before { @participant.first_name = 'a' * EXCEEDING_LENGTH }
    it { should_not be_valid }
  end

  describe 'when last name is too long' do
    before { @participant.last_name = 'a' * EXCEEDING_LENGTH }
    it { should_not be_valid }
  end

  describe 'when email address is already taken' do
    before do
      participant_with_same_email = @participant.dup
      participant_with_same_email.email = @participant.email.upcase
      participant_with_same_email.save
    end

    it { should_not be_valid }
  end
end