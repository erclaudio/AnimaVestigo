class Entry < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :link, format: { with: /\b(?:www\.)?[a-zA-Z0-9-]+\.[a-zA-Z]{2,}(?:\/[^\s]*)?\b/, message: "must be a valid link" }

  # Callbacks to calculate and set score before saving
  before_save :calculate_score

  private

  def calculate_score
    # Define the maximum possible score for each parameter
    max_score = 100.0

    # Define weights for each parameter based on their importance
    mood_weight = 15
    sleep_weight = 15
    anxiety_weight = 10
    stress_weight = 10
    energy_weight = 10
    work_weight = 10
    social_weight = 10
    happiness_weight = 10
    unexpected_changes_weight = 10

    # Calculate individual contributions
    mood_score = (mood_rating.to_f / 10) * mood_weight
    sleep_score = (sleep_quality_rating.to_f / 10) * sleep_weight
    anxiety_score = ((5 - anxiety_level.to_f) / 5) * anxiety_weight # Lower anxiety is better
    stress_score = ((5 - stress_level.to_f) / 5) * stress_weight # Lower stress is better
    energy_score = (energy_level.to_f / 5) * energy_weight
    work_score = (work_hours.to_f / 12) * work_weight # More work may contribute to stress
    social_score = (social_interactions_time.to_f / 12) * social_weight

    # Boolean impact: Happiness (positive) and Unexpected Changes (negative)
    happiness_score = happiness ? (1.0 * happiness_weight) : 0
    unexpected_changes_score = unexpected_changes ? (1.0 * unexpected_changes_weight) : 0

    # Sum all contributions
    raw_score = mood_score + sleep_score + anxiety_score + stress_score + energy_score + work_score + social_score + happiness_score - unexpected_changes_score

    # Normalize the score to a maximum of 100
    self.score = [(raw_score / max_score) * 100, 100].min.round
  end
end
  # validates :content, presence: true
