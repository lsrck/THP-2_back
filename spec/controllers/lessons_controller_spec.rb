require 'rails_helper'

RSpec.describe LessonsController, type: :controller do
  describe "#create" do
    let(:title) { Faker::LeagueOfLegends.champion.first(50) }
    let(:description) { Faker::HarryPotter.quote.first(300) }

    subject do
      post :create, params: { title: title, description: description }
    end

    it "creates the lesson" do
      expect { subject }.to change(Lesson, :count).by(1)
      expect(json_response[:lesson][:title]).to eq(title)
      expect(json_response[:lesson][:description]).to eq(description)
      first_lesson = Lesson.first
      expect(first_lesson.title).to eq(title)
      expect(first_lesson.description).to eq(description)
    end

    context "with no title" do
      let!(:title) { nil }

      it "fails creating the lesson" do
        expect { subject }.not_to(change(Lesson, :count))
        expect(response.status).to eq(403)
      end
    end
  end

  describe "#index" do
    # let permet de définir la variable :lessons et lorsqu'on appelle cette variable elle renvoit le block qui suit
    # le ! permet de lancer la création des tortues avant le test. dans le cas d'aprè sla création est appelée via l'id
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

    context "the lesson doest not exist" do
      let(:id) { "123" }

      it "returns not found" do
        subject
        expect(response).to be_not_found
        expect(response.status).to eq(404)
      end
    end
  end

  describe "#update" do
    let!(:lesson) { create(:lesson) }
    let(:id) { lesson.id }
    let(:title) { Faker::LeagueOfLegends.champion.first(50) }

    subject do
      patch :update, params: { id: id, title: title }
    end

    it "change the lesson name" do
      expect { subject }.to change { lesson.reload.title }.to(title)
      expect(json_response[:lesson][:title]).to eq(lesson.title)
    end

    context "the lesson doest not exist" do
      let(:id) { "123" }

      it "returns not found" do
        expect { subject }.not_to change(Lesson, :count)
        expect(response).to be_not_found
        expect(response.status).to eq(404)
      end
    end
  end

  describe "#destroy" do
    let!(:lesson) { create(:lesson) }
    let(:id) { lesson.id }

    subject do
      delete :destroy, params: { id: id }
    end

    it "destroy the lesson" do
      expect { subject }.to change(Lesson, :count).from(1).to(0)
      expect(response.status).to eq(204)
    end

    it "returns no content" do
      subject
      expect(response).to be_no_content
    end

    context "the lesson doest not exist" do
      let(:id) { "123" }

      it "returns not found" do
        expect { subject }.not_to change(Lesson, :count)
        expect(response).to be_not_found
        expect(response.status).to eq(404)
      end
    end
  end
end
