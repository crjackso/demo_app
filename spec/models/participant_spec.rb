require 'spec_helper'

describe Participant do
  EXCEEDING_LENGTH = 51
  #before { @participant = Participant.new(first_name: "Johnny", last_name: 'Smith', country_code: 'United States', email: 'user@example.com') }

  let(:participant) { FactoryGirl.create(:participant) }
  subject { participant }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:country_code) }

  it { should be_valid }

  describe 'when first name is not present' do
    before { participant.first_name = ' ' }
    it { should_not be_valid }
  end

  describe 'when last name is not present' do
    before { participant.last_name = ' ' }
    it { should_not be_valid }
  end

  describe 'when country code is not present' do
    before { participant.country_code = ' ' }
    it { should_not be_valid }
  end

  describe 'when first name is too long' do
    before { participant.first_name = 'a' * EXCEEDING_LENGTH }
    it { should_not be_valid }
  end

  describe 'when last name is too long' do
    before { participant.last_name = 'a' * EXCEEDING_LENGTH }
    it { should_not be_valid }
  end

  describe 'when email format is invalid' do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        participant.email = invalid_address
        participant.should_not be_valid
      end
    end
  end

  describe 'when email format is valid' do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        participant.email = valid_address
        participant.should be_valid
      end
    end
  end

  describe 'when same email address is signed up for multiple microsites' do
    before do
      microsite = Microsite.create(name: 'different.org')
      same_email_different_microsite = participant.dup
      same_email_different_microsite.microsite = microsite
      same_email_different_microsite.save
    end

    it { should be_valid }
  end

  describe 'when email address is already signed up for a microsite' do
    before do
      participant.save
      participant_with_same_email = participant.dup
      participant_with_same_email.email = participant.email.upcase
      participant_with_same_email.save
    end

    it { should_not be_valid }
  end
end