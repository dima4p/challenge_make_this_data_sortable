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

  # Selects the records containing given words case insensitive
  scope :with, -> words {
    return ordered if words.blank?
    words = Array.wrap(words).map(&:downcase).map do |word|
      sanitize_sql_like word
    end
    logger.debug "ProgrammingLanguage@#{__LINE__}.with #{words.inspect}" if logger.debug?
    cond = words.map do |word|
      "(#{[
        "lower(name) LIKE '%#{word}%'",
        "(SELECT count(*) FROM unnest(language_type) AS a(t) WHERE lower(t) LIKE '%#{word}%') > 0",
        "(SELECT count(*) FROM unnest(designed_by) AS a(t) WHERE lower(t) LIKE '%#{word}%') > 0"
      ].join ' OR '})"
    end.join ' AND '
    count = words.map do |word|
      [
        "CASE WHEN lower(name) LIKE '%#{word}%' THEN 1 ELSE 0 END",
        "(SELECT count(*) FROM unnest(language_type) AS a(t) WHERE lower(t) LIKE '%#{word}%')",
        "(SELECT count(*) FROM unnest(designed_by) AS a(t) WHERE lower(t) LIKE '%#{word}%')"
      ]
    end.flatten.join(' + ')
    select("* , #{count} AS rate")
      .where(cond)
      .order('rate DESC')
      .order('name')
  }

  # Rejects the records containing given words case insensitive
  scope :without, -> words {
    logger.debug "ProgrammingLanguage@#{__LINE__}.without #{words.inspect}" if logger.debug?
    cond = Array.wrap(words).map(&:downcase).map do |word|
      word = sanitize_sql_like word
      [
        "lower(name) NOT LIKE '%#{word}%'",
        "(SELECT count(*) FROM unnest(language_type) AS a(t) WHERE lower(t) LIKE '%#{word}%') = 0",
        "(SELECT count(*) FROM unnest(designed_by) AS a(t) WHERE lower(t) LIKE '%#{word}%') = 0"
      ]
    end.flatten.join ' AND '
    where cond
  }

end
