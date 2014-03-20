require 'spec_helper'

describe "microsites/show" do
  before(:each) do
    @microsite = assign(:microsite, stub_model(Microsite,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
