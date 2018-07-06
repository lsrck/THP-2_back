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
  it "should create a lesson" do
    lessons = Lesson.count
    create(:lesson)
    lessons += 1
    expect(Lesson.count).to eq(lessons)
  end
end
