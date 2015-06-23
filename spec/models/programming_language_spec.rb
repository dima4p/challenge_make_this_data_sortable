# == Schema Information
#
# Table name: programming_languages
#
#  id            :integer          not null, primary key
#  name          :string
#  language_type :string           default([]), is an Array
#  designed_by   :string           default([]), is an Array
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

describe ProgrammingLanguage, type: :model do

  subject { create :programming_language }

  it { should be_valid }
  it {should validate_presence_of :name}

  describe :class do
    describe :scopes do
      let(:ada) do
        create :programming_language, name: 'Ada',
                                      language_type: %w[Compiled Imperative],
                                      designed_by: ["Tucker Taft", "Jean Ichbiah"]
      end

      let(:ant) do
        create :programming_language, name: 'Ant',
                                      language_type: %w[Interpreted],
                                      designed_by: ["Jean Software Foundation"]
      end

      before :each do
        ant
        ada
      end

      describe :ordered do
        it 'orders the records by :name' do
          expect(ProgrammingLanguage.ordered).to eq ProgrammingLanguage.order(:name)
        end
      end   # :ordered

      describe :with do
        it 'filters out the records that do not contain any of the given words case insensitive' do
          expect(ProgrammingLanguage.with(['ada']).map(&:id))
            .to eq [ada.id]
          expect(ProgrammingLanguage.with(['compiled']).map(&:id))
            .to eq [ada.id]
          expect(ProgrammingLanguage.with(['tucker']).map(&:id))
            .to eq [ada.id]
          expect(ProgrammingLanguage.with(['O']).map(&:id))
            .to eq [ada.id, ant.id]
          expect(ProgrammingLanguage.with(%w[Tucker Interpreted]).map(&:id))
            .to eq []
        end

        it 'orders the languages with the same rate by name' do
          expect(ProgrammingLanguage.with(['Jean']).map(&:rate))
            .to eq [1, 1]
          expect(ProgrammingLanguage.with(['Jean']).map(&:id))
            .to eq [ada.id, ant.id]
        end

        it 'returns the ordered collection if words are empty' do
          expect(ProgrammingLanguage.with([]))
            .to eq ProgrammingLanguage.order(:name)
        end
      end   # :with

      describe :without do
        it 'filters out the records that contain any of the given words case insensitive' do
          expect(ProgrammingLanguage.without(['ada']).map(&:id)).to eq [ant.id]
          expect(ProgrammingLanguage.without(['compiled']).map(&:id)).to eq [ant.id]
          expect(ProgrammingLanguage.without(['tucker']).map(&:id)).to eq [ant.id]
          expect(ProgrammingLanguage.without(['O']).map(&:id)).to eq []
        end

        it 'returns the original collection if words are empty' do
          expect(ProgrammingLanguage.ordered.without([]))
            .to eq ProgrammingLanguage.order(:name)
        end
      end   # :without
    end   # :scopes
  end   # :class

end
