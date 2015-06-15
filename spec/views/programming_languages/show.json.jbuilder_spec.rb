require 'rails_helper'

describe "programming_languages/show.json.jbuilder", type: :view do
  before(:each) do
    @programming_language = assign(:programming_language, create(:programming_language))
  end

  attributes = %w[
    id
    name
    language_type
    designed_by
    created_at
    updated_at
  ]

  it "renders the following attributes of programming_language: #{attributes.join(', ')} as json" do
    render

    hash = MultiJson.load rendered
    expect(hash.keys.sort).to eq attributes.sort
    expected = @programming_language.attributes.slice *attributes
    expected = MultiJson.load MultiJson.dump expected
    expect(hash).to eq expected
    # expect(hash['id']).to eq @programming_language.id.to_s
    # expect(hash['name']).to eq @programming_language.name.to_s
    # expect(hash['language_type']).to eq @programming_language.language_type.to_s
    # expect(hash['designed_by']).to eq @programming_language.designed_by.to_s
    # expect(hash['created_at']).to eq @programming_language.created_at.to_s
    # expect(hash['updated_at']).to eq @programming_language.updated_at.to_s
  end
end
