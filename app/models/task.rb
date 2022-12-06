class Task < ApplicationRecord
  validates :name, :details, :date, presence: true
  belongs_to :category
end
