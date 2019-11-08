class Message < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  
  #display most recent last at a maximum at 50
  scope :for_display, -> { order(:created_at).last(50) }
end
