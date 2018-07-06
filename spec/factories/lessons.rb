FactoryBot.define do
  factory :lesson do
    title "Lorem Ipsum"

    factory :lesson_long do
      title "this title is too long to be validated because it's ore than 50 chars"
    end
  end
end
