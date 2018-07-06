# == Schema Information
#
# Table name: lessons
#
#  id          :uuid             not null, primary key
#  description :text
#  title       :string(50)       not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Lesson, type: :model do
  context "validation" do
    it "should validate title length" do
      lesson = build(:lesson_long)
      expect(lesson.valid?).to be false
      lesson = build(:lesson)
      expect(lesson.valid?).to be true
    end
    it "should validate description length" do
      lesson = Lesson.new(description: "")
      expect(lesson.valid?).to be false
    end
  end
end
