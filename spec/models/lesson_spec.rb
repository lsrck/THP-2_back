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
    expect(Lesson.first.title).to eq(lesson.title)
  end
end

RSpec.describe Lesson, type: :model do
  context "validation" do
    it { should validate_length_of(:title).is_at_most(50) }
    it { should validate_length_of(:description).is_at_most(300) }
    it { should validate_presence_of(:title) }
  end
end
