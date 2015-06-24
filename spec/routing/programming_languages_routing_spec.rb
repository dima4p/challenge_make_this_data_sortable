require "rails_helper"

RSpec.describe ProgrammingLanguagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/programming_languages")
        .to route_to("programming_languages#index")
    end

    it "does not route to #new" do
      expect(:get => "/programming_languages/new")
        .not_to route_to("programming_languages#new")
    end

    it "does not route to #show" do
      expect(:get => "/programming_languages/1")
        .not_to route_to("programming_languages#show", :id => "1")
    end

    it "does not route to #edit" do
      expect(:get => "/programming_languages/1/edit")
        .not_to route_to("programming_languages#edit", :id => "1")
    end

    it "does not route to #create" do
      expect(:post => "/programming_languages")
        .not_to route_to("programming_languages#create")
    end

    it "does not route to #update via PUT" do
      expect(:put => "/programming_languages/1")
        .not_to route_to("programming_languages#update", :id => "1")
    end

    it "does not route to #update via PATCH" do
      expect(:patch => "/programming_languages/1")
        .not_to route_to("programming_languages#update", :id => "1")
    end

    it "does not route to #destroy" do
      expect(:delete => "/programming_languages/1")
        .not_to route_to("programming_languages#destroy", :id => "1")
    end

  end
end
