require 'rails_helper'

RSpec.describe LessonsController, type: :controller do
  describe "#create"
  describe "#index"
  describe "#show" do
    let(:lesson) { create(:lesson) }
    let(:id) { turtle.id }
    
    subject do
      get :show, {params: { id: id } }
    end

    it "returns the turtle" do
      subject do
        expect(json_response[:lesson][:id]).to eq(lesson.id)
        expect(json_response[:lesson][:title]).to eq(lesson.title)
        expect(json_response[:lesson][:description]).to eq(lesson.description)

      end
    end

  end
  describe "#update"
  describe "#destroy"
end
