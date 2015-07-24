require 'rails_helper'

RSpec.describe "topics_labels/index", type: :view do
  before(:each) do
    assign(:topics_labels, [
      TopicsLabel.create!(
        :topic => nil,
        :label => nil
      ),
      TopicsLabel.create!(
        :topic => nil,
        :label => nil
      )
    ])
  end

  it "renders a list of topics_labels" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
