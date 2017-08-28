require 'rails_helper'

RSpec.describe Goal, type: :model do

  subject(:public_goal) do
    FactoryGirl.build(:goal,
    title: "Workout Every Day",
    body: "Hit the gym errday",
    private_goal?: false,
    completed?: false,
    user_id: 1)
  end


  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:private_goal?) }
  it { should validate_presence_of(:completed?) }
  it { should belong_to :user }

end
