# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

JSON.load(Rails.root.join 'db', 'seeds', 'data.json').each do |record|
  programming_language = ProgrammingLanguage.find_or_create_by name: record['Name']
  programming_language.update(
    language_type: record['Type'].split(/, */),
    designed_by: record['Designed by'].split(/, */)
  )
end
