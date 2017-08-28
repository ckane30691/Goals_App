class Goal < ApplicationRecord

  validates :title, :body, :user, :private_goal?, :completed?, presence: true

  belongs_to :user


end
