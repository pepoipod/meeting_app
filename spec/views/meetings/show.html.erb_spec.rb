require 'rails_helper'

RSpec.describe "meetings/show", type: :view do
  before(:each) do
    @meeting = assign(:meeting, Meeting.create!(
      :finished_flg => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
  end
end
