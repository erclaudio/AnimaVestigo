class AddDetailsToEntries < ActiveRecord::Migration[7.1]
  def change
    change_table :entries do |t|
      # Mood Rating
      t.integer :mood_rating, limit: 1 # Rating from 1 to 10

      # Physical Health
      t.integer :sleep_quality_hours # Hours of sleep
      t.integer :sleep_quality_rating # Sleep quality rating
      t.string :exercise_type # Type of exercise
      t.string :exercise_intensity # Intensity of exercise
      t.boolean :skipped_meals # Nutrition (skipped meals)

      # Mental and Emotional Health
      t.integer :anxiety_level # Anxiety levels (1-5)
      t.integer :stress_level # Stress levels (1-5)
      t.integer :energy_level # Energy levels (1-5)
      t.boolean :happiness # Feelings of happiness (true/false)

      # Daily Activities
      t.integer :work_hours # Work or study hours
      t.integer :social_interactions_time # Time spent with friends/family
      t.integer :hobbies_time # Time spent on hobbies
      t.integer :mindfulness_time # Time spent on mindfulness

      # Triggers and Events
      t.boolean :unexpected_changes # Unexpected changes in routine

      # Thought Patterns
      t.text :journaling_thoughts # Journaling about specific thoughts or worries
      t.text :positive_affirmations # Positive affirmations
      t.text :notable_dreams # Notable dreams or nightmares
    end
  end
end
