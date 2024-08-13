module ApplicationHelper
  def generate_user_prompt(entry)
    <<~PROMPT
      On #{entry.created_at.strftime("%a, %d %b %Y")} at #{entry.created_at.strftime("%H:%M")}, you had a #{translate_mood_rating(entry.mood_rating)} day. 
      Your sleep quality was #{translate_sleep_quality(entry.sleep_quality_rating)}. 
      You felt #{translate_anxiety_level(entry.anxiety_level)} anxious and #{translate_stress_level(entry.stress_level)} stressed. 
      Your energy level was #{translate_energy_level(entry.energy_level)}. 
      You felt #{translate_happiness(entry.happiness)} in terms of happiness.
      You worked for #{translate_work_hours(entry.work_hours)} hours. 
      You spent #{translate_social_interactions_time(entry.social_interactions_time)} with social interactions and 
      #{translate_hobbies_time(entry.hobbies_time)} hours on hobbies.
      You #{translate_unexpected_changes(entry.unexpected_changes)} encountered unexpected changes.
      You spent #{translate_mindfulness_time(entry.mindfulness_time)} on mindfulness.
      
      Here are your journaling thoughts: #{entry.journaling_thoughts}
      Positive affirmations: #{entry.positive_affirmations}
      Notable dreams: #{entry.notable_dreams}
      
      Your overall score for the day was #{entry.score}.
    PROMPT
  end
end
