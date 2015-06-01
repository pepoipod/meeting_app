require 'rails_helper'

RSpec.describe "meetings/new", type: :view do
  before(:each) do
    assign(:meeting, Meeting.new(
      :finished_flg => false
    ))
  end

  it "renders new meeting form" do
    render

    assert_select "form[action=?][method=?]", meetings_path, "post" do

      assert_select "input#meeting_finished_flg[name=?]", "meeting[finished_flg]"
    end
  end
end
