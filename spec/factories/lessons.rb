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

FactoryBot.define do
  factory :lesson do
    title { Faker::Pokemon.name.first(50) }
    description { Faker::Pokemon.move.first(300) }
  end
end
