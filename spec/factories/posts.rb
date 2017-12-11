FactoryBot.define do
  factory :post do
    date Date.today
    rationale 'fb test post dated today'
    user
  end

  factory :another_post, class: "Post" do
    date Date.yesterday
    rationale 'Another fb test post dated yesterday.'
    user
  end
end