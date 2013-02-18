
FactoryGirl.define do
  factory :solution_box, :class => Refinery::SolutionBoxes::SolutionBox do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

