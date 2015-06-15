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

# Model ProgrammingLanguage defines the main model that keeps data
#
class ProgrammingLanguage < ActiveRecord::Base

  validates :name, presence: true

  scope :ordered, -> { order(:name) }

end
