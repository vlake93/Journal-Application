class Task < ApplicationRecord
  validates :name, :details, :date, presence: true
  belongs_to :category
  has_one :user, through: :category
end
