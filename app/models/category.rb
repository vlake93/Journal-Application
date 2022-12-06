class Category < ApplicationRecord
  validates :name, presence: true
  validates_uniqueness_of :name, details: "already exists"
  
  belongs_to :user
  has_many :tasks, dependent: :destroy
end
