# This is the main controller
class ProgrammingLanguagesController < ApplicationController
  before_action :set_programming_language, only: [:show, :edit, :update, :destroy]

  # GET /programming_languages
  # GET /programming_languages.json
  def index
    words = params[:q] && Shellwords.split(params[:q]).map(&:squish)
    if words.present?
      @with = words.reject{|word| word.first == '-'}
      @without = words.select{|word| word.first == '-'}.map do |word|
        word[1..-1]
      end
      @programming_languages =
          ProgrammingLanguage.with(@with).without(@without)
    else
      @programming_languages = ProgrammingLanguage.ordered
    end
  end
end
