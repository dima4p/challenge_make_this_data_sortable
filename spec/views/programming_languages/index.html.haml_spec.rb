require 'rails_helper'

describe "programming_languages/index", type: :view do
  before(:each) do
    @programming_language = create(:programming_language)
    assign(:programming_languages, [@programming_language, @programming_language])
  end

  it "renders a list of programming_languages" do
    render

    # expect(rendered).to eq ''
    assert_select 'tr>td', text: @programming_language.name.to_s, count: 2
    assert_select 'tr>td', text: @programming_language.language_type.to_sentence, count: 2
    assert_select 'tr>td', text: @programming_language.designed_by.to_sentence, count: 2
  end

  it 'renders a form for search' do
    render

    assert_select "form[action='#{programming_languages_path}'][method='get']" do
      assert_select 'input#q[name=?]', 'q'
    end
  end

end
