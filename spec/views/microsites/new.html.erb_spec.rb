require 'spec_helper'

describe "microsites/new" do
  before(:each) do
    assign(:microsite, stub_model(Microsite,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new microsite form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => microsites_path, :method => "post" do
      assert_select "input#microsite_name", :name => "microsite[name]"
    end
  end
end
