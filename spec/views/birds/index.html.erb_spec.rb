require 'rails_helper'

RSpec.describe "birds/index", type: :view do
  before(:each) do
    @birds = assign(:birds, FactoryGirl.create_list(:bird, 2))
  end

  it "renders a list of birds" do
    render
    expect(rendered).to match(/#{@birds.first.name}/)
    expect(rendered).to match(/#{@birds.last.name}/)
  end
end
