require 'rails_helper'

RSpec.describe "pages_categories/edit", type: :view do
  before(:each) do
    @pages_category = assign(:pages_category, PagesCategory.create!(
      :page => nil,
      :category => nil
    ))
  end

  it "renders the edit pages_category form" do
    render

    assert_select "form[action=?][method=?]", pages_category_path(@pages_category), "post" do

      assert_select "input#pages_category_page_id[name=?]", "pages_category[page_id]"

      assert_select "input#pages_category_category_id[name=?]", "pages_category[category_id]"
    end
  end
end
