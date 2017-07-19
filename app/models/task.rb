class Task < ApplicationRecord
  belongs_to :project
  validates :title, 
  presence: true
  scope :unfinished, -> { where(done: false) }
end
