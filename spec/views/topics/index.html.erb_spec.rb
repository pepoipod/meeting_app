require 'rails_helper'

RSpec.describe "topics/index", type: :view do
  before(:each) do
    assign(:topics, [
      Topic.create!(
        :title => "Title",
        :body => "MyText",
        :user => nil,
        :finished_flg => false,
        :page => nil
      ),
      Topic.create!(
        :title => "Title",
        :body => "MyText",
        :user => nil,
        :finished_flg => false,
        :page => nil
      )
    ])
  end

  it "renders a list of topics" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
