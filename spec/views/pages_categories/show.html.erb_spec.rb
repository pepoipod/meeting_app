require 'rails_helper'

RSpec.describe "pages_categories/show", type: :view do
  before(:each) do
    @pages_category = assign(:pages_category, PagesCategory.create!(
      :page => nil,
      :category => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
