require 'rails_helper'

describe "programming_languages/show", type: :view do
  before(:each) do
    @programming_language = assign(:programming_language, create(:programming_language))
  end

  it "renders attributes in <dl>" do
    render
    assert_select 'dl>dd', text: Regexp.new(@programming_language.name.to_s)
    assert_select 'dl>dd', text: Regexp.new(@programming_language.language_type.to_sentence)
    assert_select 'dl>dd', text: Regexp.new(@programming_language.designed_by.to_sentence)
  end
end
