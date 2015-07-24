require 'rails_helper'

RSpec.describe "topics_labels/edit", type: :view do
  before(:each) do
    @topics_label = assign(:topics_label, TopicsLabel.create!(
      :topic => nil,
      :label => nil
    ))
  end

  it "renders the edit topics_label form" do
    render

    assert_select "form[action=?][method=?]", topics_label_path(@topics_label), "post" do

      assert_select "input#topics_label_topic_id[name=?]", "topics_label[topic_id]"

      assert_select "input#topics_label_label_id[name=?]", "topics_label[label_id]"
    end
  end
end
