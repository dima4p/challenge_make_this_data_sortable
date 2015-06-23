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

  describe "GET show" do
    it "assigns the requested programming_language as @programming_language" do
      programming_language = create :programming_language
      get :show, {id: programming_language.to_param}, valid_session
      expect(assigns(:programming_language)).to eq(programming_language)
    end
  end

  describe "GET new" do
    it "assigns a new programming_language as @programming_language" do
      get :new, {}, valid_session
      expect(assigns(:programming_language)).to be_a_new(ProgrammingLanguage)
    end
  end

  describe "GET edit" do
    it "assigns the requested programming_language as @programming_language" do
      programming_language = create :programming_language
      get :edit, {id: programming_language.to_param}, valid_session
      expect(assigns(:programming_language)).to eq(programming_language)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ProgrammingLanguage" do
        expect do
          post :create, {programming_language: valid_attributes}, valid_session
        end.to change(ProgrammingLanguage, :count).by(1)
      end

      it "assigns a newly created programming_language as @programming_language" do
        post :create, {programming_language: valid_attributes}, valid_session
        expect(assigns(:programming_language)).to be_a(ProgrammingLanguage)
        expect(assigns(:programming_language)).to be_persisted
      end

      it "redirects to the created programming_language" do
        post :create, {programming_language: valid_attributes}, valid_session
        expect(response).to redirect_to(ProgrammingLanguage.last)
        # expect(response).to redirect_to(programming_languages_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved programming_language as @programming_language" do
        # allow_any_instance_of(ProgrammingLanguage).to receive(:save).and_return(false)
        post :create, {programming_language: invalid_attributes}, valid_session
        expect(assigns(:programming_language)).to be_a_new(ProgrammingLanguage)
      end

      it "re-renders the 'new' template" do
        # allow_any_instance_of(ProgrammingLanguage).to receive(:save).and_return(false)
        post :create, {programming_language: invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end   # describe "POST create"

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) { {name: 'New value'} }

      it "updates the requested programming_language" do
        programming_language = create :programming_language
        # expect_any_instance_of(ProgrammingLanguage)
        #   .to receive(:update).with(new_attributes.inject({}){|_, (k, v)| _[k] = v.to_s; _})
        put :update, {id: programming_language.to_param, programming_language: new_attributes}, valid_session
        programming_language.reload
        # skip("Add assertions for updated state")
        expect(programming_language.name).to eq 'New value'
      end

      it "assigns the requested programming_language as @programming_language" do
        programming_language = create :programming_language
        put :update, {id: programming_language.to_param, programming_language: valid_attributes}, valid_session
        expect(assigns(:programming_language)).to eq(programming_language)
      end

      it "redirects to the programming_language" do
        programming_language = create :programming_language
        put :update, {id: programming_language.to_param, programming_language: valid_attributes}, valid_session
        expect(response).to redirect_to(programming_language)
      end
    end

    describe "with invalid params" do
      it "assigns the programming_language as @programming_language" do
        programming_language = create :programming_language
        # allow_any_instance_of(ProgrammingLanguage).to receive(:update).and_return(false)
        put :update, {id: programming_language.to_param, programming_language: invalid_attributes}, valid_session
        expect(assigns(:programming_language)).to be_a(ProgrammingLanguage)
      end

      it "re-renders the 'edit' template" do
        programming_language = create :programming_language
        # allow_any_instance_of(ProgrammingLanguage).to receive(:update).and_return(false)
        put :update, {id: programming_language.to_param, programming_language: invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end   # describe "PUT update"

  describe "DELETE destroy" do
    it "destroys the requested programming_language" do
      programming_language = create :programming_language
      expect do
        delete :destroy, {id: programming_language.to_param}, valid_session
      end.to change(ProgrammingLanguage, :count).by(-1)
    end

    it "redirects to the programming_languages list" do
      programming_language = create :programming_language
      delete :destroy, {id: programming_language.to_param}, valid_session
      expect(response).to redirect_to(programming_languages_url)
    end
  end   # describe "DELETE destroy"

end
