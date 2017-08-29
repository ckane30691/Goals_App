class Goal < ApplicationRecord

  validates :title, :body, :user, presence: true
  validates_inclusion_of :is_private, in: [true, false]
  validates_inclusion_of :completed, in: [true, false]

  belongs_to :user

  def self.completed_goals_for_user(user)
    user.goals.where(completed: true)
  end

  def self.all_public_goals
    Goal.all.where(is_private: false)
  end

  def mark_complete!
    self.completed = true
    self.save!
    self.completed
  end

  def mark_incomplete!
    self.completed = false
    self.save!
    self.completed
  end

  def mark_private!
    self.is_private = true
    self.save!
    self.is_private
  end

  def mark_public!
    self.is_private = false
    self.save!
    self.is_private
  end

end
