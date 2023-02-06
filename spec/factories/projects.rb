# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    name { Faker::Coffee.blend_name }
    star_count { rand(99) }
    raw_data { JSON.parse(GITHUB_RESPONSE_SUCCESS).sample }
    user
  end
end
