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
  it "is creatable" do
    lesson = create(:lesson)
    first_lesson = Lesson.first
    expect(first_lesson.title).to eq(lesson.title)
    expect(first_lesson.description).to eq(lesson.description)
    expect(lesson.title).not_to be_blank
  end
end

RSpec.describe Lesson, type: :model do
  context "validation" do
    it { is_expected.to validate_length_of(:title).is_at_most(50) }
    it { is_expected.to validate_length_of(:description).is_at_most(300) }
    it { is_expected.to validate_presence_of(:title) }
  end
end
