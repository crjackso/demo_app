require 'spec_helper'

describe Participant do
  EXCEEDING_LENGTH = 51

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
    it 'should be invalid' do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      participant = FactoryGirl.build(:participant, :with_microsite)
      addresses.each do |invalid_address|
        participant.email = invalid_address
        participant.should_not be_valid
      end
    end
  end

  describe 'when email format is valid' do
    it 'should be valid' do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      participant = FactoryGirl.build(:participant, :with_microsite)
      addresses.each do |valid_address|
        participant.email = valid_address
        participant.should be_valid
      end
    end
  end

  describe 'when same email address is signed up for multiple microsites' do
    it 'should be valid' do
      microsite = FactoryGirl.create(:microsite, name:'nowisourmoment.org')
      different_microsite = FactoryGirl.create(:microsite, name: 'different.org')
      participant = FactoryGirl.create(:participant, email: 'same@mail.com', microsite: microsite)
      participant_for_different_microsite = FactoryGirl.create(:participant, email: 'same@mail.com', microsite: different_microsite)
      participant_for_different_microsite.should be_valid
    end
  end

  describe 'when email address is already signed up for a microsite' do
    it 'should not be valid' do
      microsite = FactoryGirl.create(:microsite, name: 'nowisourmoment.org')
      participant = FactoryGirl.create(:participant, email: 'someone@mail.com', microsite: microsite)

      participant_with_same_email_and_microsite = Participant.create(email: 'someone@mail.com', microsite: microsite)
      participant_with_same_email_and_microsite.should_not be_valid
    end
  end
end