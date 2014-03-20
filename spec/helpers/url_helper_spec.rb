require 'spec_helper'

describe UrlHelper do
  describe "unique url generation" do
    it "should return base microsite if influencer is not specified" do
      microsite = 'nowisourmoment.org'
      unique_url = generate_unique_url(microsite, 0)
      unique_url.should == microsite
    end

    it "should return unique url given a valid microsite and influencer" do
      microsite = 'nowisourmoment.org'
      unique_url = generate_unique_url(microsite, 1)
      unique_url.should == 'nowisourmoment.org/?influencer=NV'
    end
  end
end