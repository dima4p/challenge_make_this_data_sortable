class CreateProgrammingLanguages < ActiveRecord::Migration
  def change
    create_table :programming_languages do |t|
      t.string :name
      t.string :language_type, array: true, default: []
      t.string :designed_by, array: true, default: []

      t.timestamps null: false
    end
  end
end
