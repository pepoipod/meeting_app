require 'rails_helper'

RSpec.describe "topics_labels/show", type: :view do
  before(:each) do
    @topics_label = assign(:topics_label, TopicsLabel.create!(
      :topic => nil,
      :label => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
