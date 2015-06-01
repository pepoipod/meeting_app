require 'rails_helper'

RSpec.describe "meetings/index", type: :view do
  before(:each) do
    assign(:meetings, [
      Meeting.create!(
        :finished_flg => false
      ),
      Meeting.create!(
        :finished_flg => false
      )
    ])
  end

  it "renders a list of meetings" do
    render
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
