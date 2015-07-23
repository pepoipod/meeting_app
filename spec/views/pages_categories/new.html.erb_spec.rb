require 'rails_helper'

RSpec.describe "pages_categories/new", type: :view do
  before(:each) do
    assign(:pages_category, PagesCategory.new(
      :page => nil,
      :category => nil
    ))
  end

  it "renders new pages_category form" do
    render

    assert_select "form[action=?][method=?]", pages_categories_path, "post" do

      assert_select "input#pages_category_page_id[name=?]", "pages_category[page_id]"

      assert_select "input#pages_category_category_id[name=?]", "pages_category[category_id]"
    end
  end
end
