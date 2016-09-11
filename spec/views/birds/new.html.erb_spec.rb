require 'rails_helper'

RSpec.describe "birds/new", type: :view do
  before(:each) do
    assign(:bird, FactoryGirl.build(:bird))
  end

  it "renders new bird form" do
    render

    assert_select "form[action=?][method=?]", birds_path, "post" do

      assert_select "input#bird_name[name=?]", "bird[name]"

      assert_select "input#bird_family[name=?]", "bird[family]"

      assert_select "input#bird_added[name=?]", "bird[added]"

      assert_select "input#bird_visible[name=?]", "bird[visible]"
    end
  end
end
