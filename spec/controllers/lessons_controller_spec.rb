require 'rails_helper'

RSpec.describe LessonsController, type: :controller do
  describe "#create"

  describe "#index" do
  #let permet de définir la variable :lessons et lorsqu'on appelle cette variable elle renvoit le block qui suit
  #le ! permet de lancer la création des tortues avant le test. dans le cas d'aprè sla création est appelée via l'id
    let!(:lessons) { create_list(:lesson, 5) }

    subject do
      get :index
    end

    it "returns all the lessons" do
      subject
        expect(response.status).to eq(200)
        expect(json_response[:lessons].size).to eq(5)
    end
  end

  describe "#show" do
    let(:lesson) { create(:lesson) }
    let(:id) { lesson.id }

    subject do
      get :show, params: { id: id }
    end

    it "returns the lesson" do
      subject
        expect(json_response[:lesson][:id]).to eq(lesson.id)
        expect(json_response[:lesson][:title]).to eq(lesson.title)
        expect(json_response[:lesson][:description]).to eq(lesson.description)
    end

    context "the lesson doest not exist"do
      let(:id) { "123" }

      it "returns not found" do
        subject
          expect(response).to be_not_found
          expect(response.status).to eq(404)
      end
    end
  end

  describe "#update"
  describe "#destroy"
end
