require 'spec_helper'

describe "microsites/edit" do
  before(:each) do
    @microsite = assign(:microsite, stub_model(Microsite,
      :name => "MyString"
    ))
  end

  it "renders the edit microsite form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => microsites_path(@microsite), :method => "post" do
      assert_select "input#microsite_name", :name => "microsite[name]"
    end
  end
end
