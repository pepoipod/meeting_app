require 'rails_helper'

RSpec.describe "topics_labels/new", type: :view do
  before(:each) do
    assign(:topics_label, TopicsLabel.new(
      :topic => nil,
      :label => nil
    ))
  end

  it "renders new topics_label form" do
    render

    assert_select "form[action=?][method=?]", topics_labels_path, "post" do

      assert_select "input#topics_label_topic_id[name=?]", "topics_label[topic_id]"

      assert_select "input#topics_label_label_id[name=?]", "topics_label[label_id]"
    end
  end
end
