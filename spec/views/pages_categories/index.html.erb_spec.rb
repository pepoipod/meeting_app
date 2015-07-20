require 'rails_helper'

RSpec.describe "pages_categories/index", type: :view do
  before(:each) do
    assign(:pages_categories, [
      PagesCategory.create!(
        :page => nil,
        :category => nil
      ),
      PagesCategory.create!(
        :page => nil,
        :category => nil
      )
    ])
  end

  it "renders a list of pages_categories" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
