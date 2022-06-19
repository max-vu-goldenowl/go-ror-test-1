# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :user do
    username { Faker::Name.name.downcase.gsub("'", '').split(' ').join('-') }
    email { Faker::Internet.email }
  end
end
