require 'rails_helper'

RSpec.describe Goal, type: :model do

  subject(:public_goal) do
    FactoryGirl.build(:goal,
    title: "Workout Every Day",
    body: "Hit the gym errday",
    is_private: false,
    completed: false,
    user_id: 1)
  end


  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:user) }
  it { should validate_inclusion_of(:is_private).in_array([true, false]) }
  it { should validate_inclusion_of(:completed).in_array([true, false]) }
  it { should belong_to :user }

  describe "::all_public_goals" do
    it "returns a list with all the public goals" do
      expect(Goal.all_public_goals).to eq(Goal.all - Goal.all.where(is_private: true))
    end
  end

  describe "::completed_goals_for_user" do

    let!(:user) { User.create!(username: "Johnny", password: "johnnyjohnny") }

    it "returns a list with all completed goals for a user" do
      expect(Goal.completed_goals_for_user(user)).to eq(user.goals - user.goals.where(completed: false))
    end
  end

  describe "#mark_complete!" do

    let!(:user) { User.create!(id: 1, username: "Johnny", password: "johnnyjohnny") }

    it "Marks a goal complete" do
      public_goal.mark_complete!
      expect(public_goal.completed).to eq(true)
    end
  end

  describe "#mark_incomplete!" do

    let!(:user) { User.create!(id: 1, username: "Johnny", password: "johnnyjohnny") }

    it "Marks a goal incomplete" do
      public_goal.mark_incomplete!
      expect(public_goal.completed).to eq(false)
    end
  end

  describe "#mark_private!" do

    let!(:user) { User.create!(id: 1, username: "Johnny", password: "johnnyjohnny") }

    it "Marks a goal private" do
      public_goal.mark_private!
      expect(public_goal.is_private).to eq(true)
    end
  end
  describe "#mark_public!" do

    let!(:user) { User.create!(id: 1, username: "Johnny", password: "johnnyjohnny") }
    let!(:private_goal) { Goal.create!(user_id: 1, title: "My Private Goal", body: "Eat lots of ice cream", is_private: true) }

    it "Marks a goal public" do
      private_goal.mark_public!
      expect(private_goal.is_private).to eq(false)
    end
  end

end
