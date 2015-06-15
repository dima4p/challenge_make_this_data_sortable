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

FactoryGirl.define do
  factory :programming_language do
    sequence(:name) {|n| "ProgrammingLanguage ##{n}" }
    sequence(:language_type) {|n| ["Type #{n}-1", "Type #{n}-2"] }
    sequence(:designed_by) {|n| ["Designed by #{n}-1", "Designed by #{n}-2"] }
  end
end
