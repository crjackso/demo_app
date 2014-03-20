require 'spec_helper'

describe Microsite do

  it 'should be valid' do
    microsite = FactoryGirl.build(:microsite)
    microsite.should be_valid
  end

  context 'when name is not present' do
    it 'should not be valid' do
      microsite = FactoryGirl.build(:microsite)
      microsite.name = ''
      microsite.should_not be_valid
    end
  end
end
