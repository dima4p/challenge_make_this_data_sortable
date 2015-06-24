require 'spec_helper'

describe ProgrammingLanguagesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # ProgrammingLanguage. As you add validations to ProgrammingLanguage, be sure to
  # adjust the attributes here as well. The list could not be empty.
  let(:valid_attributes) {FactoryGirl.build(:programming_language).attributes.slice *%w[name]}

  let(:invalid_attributes) do
    {name: ''}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ProgrammingLanguagesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all programming_languages as @programming_languages" do
      programming_language = create :programming_language
      get :index, {}, valid_session
      expect(assigns(:programming_languages)).to be_kind_of(ActiveRecord::Relation)
      expect(assigns(:programming_languages)).to eq([programming_language])
    end

    context 'when query is present' do
      let(:query) do
        {q: %q(  one " two " ' two and  a  half ' -three )}
      end

      it 'assigns the positive words to @with removing extra spaced' do
        get :index, query, valid_session
        expect(assigns(:with)).to eq ['one', 'two', 'two and a half']
      end

      it 'assigns the negative words to @without removing extra spaced' do
        get :index, query, valid_session
        expect(assigns(:without)).to eq ['three']
      end

      it 'sends to ProgrammingLanguage :with and :without calls' do
        expect(ProgrammingLanguage).to receive(:with)
          .with(['one', 'two', 'two and a half']) {ProgrammingLanguage}
        expect(ProgrammingLanguage).to receive(:without)
          .with(['three']) {ProgrammingLanguage}
        get :index, query, valid_session
      end
    end
  end
end
