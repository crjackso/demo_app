require 'spec_helper'

describe UrlHelper do
  describe "unique url generation" do
    it "should return base microsite if influencer is not specified" do
      microsite = 'nowisourmoment.org'
      unique_url = generate_unique_url(microsite, nil)
      unique_url.should == microsite
    end

    it "should return unique url given a valid microsite and influencer" do
      microsite = 'nowisourmoment.org'
      unique_url = generate_unique_url(microsite, 1)
      unique_url.should_not  == 'nowisourmoment.org/?influencer=1'
      unique_url.should match(/\?influencer=[A-Z]+/)
    end
  end
end