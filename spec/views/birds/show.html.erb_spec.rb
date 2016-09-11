require 'rails_helper'

RSpec.describe "birds/show", type: :view do
  before(:each) do
    @bird = assign(:bird, FactoryGirl.build(:bird))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@bird.name}/)
    expect(rendered).to match(/#{@bird.family}/)
  end
end
