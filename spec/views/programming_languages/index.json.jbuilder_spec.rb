require 'rails_helper'

describe "programming_languages/index.json.jbuilder", type: :view do
  before(:each) do
    @programming_language = create(:programming_language)
    assign :programming_languages, [@programming_language, @programming_language]
  end

  attributes = %w[
    id
    name
    language_type
    designed_by
    url
  ]

  it "renders a list of programming_languages as json with following attributes: #{attributes.join(', ')}" do
    render

    hash = MultiJson.load rendered
    expect(hash.first).to eq(hash = hash.last)
    expect(hash.keys.sort).to eq attributes.sort
    expected = @programming_language.attributes.slice *attributes
    expected = MultiJson.load MultiJson.dump expected
    expected['url'] = programming_language_url(@programming_language, format: 'json')
    expect(hash).to eq expected
    # expect(hash['id']).to eq @programming_language.id.to_s
    # expect(hash['name']).to eq @programming_language.name.to_s
    # expect(hash['language_type']).to eq @programming_language.language_type.to_s
    # expect(hash['designed_by']).to eq @programming_language.designed_by.to_s
    # expect(hash['url']).to eq programming_language_url(@programming_language, format: 'json')
  end
end
