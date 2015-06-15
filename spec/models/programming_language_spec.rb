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
    it 'should respond to :ordered' do
      create :programming_language
      create :programming_language
      expect(ProgrammingLanguage.ordered).to eq ProgrammingLanguage.order(:name)
    end
  end

end
