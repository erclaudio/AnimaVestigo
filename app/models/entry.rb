class Entry < ApplicationRecord
  validates :name, presence: true
  validates :link, format: { with: /\b(?:www\.)?[a-zA-Z0-9-]+\.[a-zA-Z]{2,}(?:\/[^\s]*)?\b/, message: "must be a valid link" }
  # validates :content, presence: true

end 
