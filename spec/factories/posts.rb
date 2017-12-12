FactoryBot.define do
  factory :post do
    date Date.today
    rationale 'fb1 post dated today'
    user
  end

  factory :another_post, class: "Post" do
    date Date.yesterday
    rationale 'Another fb2  post dated yesterday.'
    user
  end
end