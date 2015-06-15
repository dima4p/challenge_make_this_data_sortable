require 'rails_helper'

describe "programming_languages/edit", type: :view do
  before(:each) do
    @programming_language = assign(:programming_language, create(:programming_language))
  end

  it "renders the edit programming_language form" do
    render

    assert_select "form[action='#{programming_language_path(@programming_language)}'][method='post']" do
      assert_select 'input#programming_language_name[name=?]', 'programming_language[name]'
      assert_select 'input#programming_language_language_type[name=?]', 'programming_language[language_type]'
      assert_select 'input#programming_language_designed_by[name=?]', 'programming_language[designed_by]'
    end
  end
end