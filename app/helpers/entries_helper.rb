module EntriesHelper
  # Mood Rating translation
  def translate_mood_rating(rating)
    case rating
    when 1..2
      "a very bad"
    when 3..4
      "a bad"
    when 5..6
      "a cheerful"
    when 7..8
      "a good"
    when 9..10
      "an excellent"
    else
      "an undefined"
    end
  end

  # Sleep Quality Rating translation
  def translate_sleep_quality(rating)
    case rating
    when 1..2
      "badly"
    when 3..4
      "poorly"
    when 5..6
      "okay"
    when 7..8
      "well"
    when 9..10
      "very well"
    else
      "undefined"
    end
  end

  # Anxiety Level translation
  def translate_anxiety_level(level)
    case level
    when 1
      "not at all"
    when 2
      "a little"
    when 3
      "somewhat"
    when 4
      "quite"
    when 5
      "extremely"
    else
      "undefined"
    end
  end

  # Stress Level translation
  def translate_stress_level(level)
    case level
    when 1
      "not at all"
    when 2
      "a little"
    when 3
      "somewhat"
    when 4
      "quite"
    when 5
      "extremely"
    else
      "undefined"
    end
  end

  # Energy Level translation
  def translate_energy_level(level)
    case level
    when 1
      "very low"
    when 2
      "low"
    when 3
      "medium"
    when 4
      "high"
    when 5
      "very high"
    else
      "undefined"
    end
  end

  # Happiness translation
  def translate_happiness(happy)
    happy ? "happy" : "not happy"
  end

  # Unexpected Changes translation
  def translate_unexpected_changes(changes)
    changes ? "had unexpected changes in my routine" : "had no unexpected changes in my routine"
  end

  # Work Hours translation
  def translate_work_hours(hours)
    case hours
    when 0..4
      "light"
    when 5..8
      "moderate"
    when 9..12
      "intense"
    else
      "undefined"
    end
  end

  # Social Interactions translation
  def translate_social_interactions_time(time)
    case time
    when 0
      "no social interaction"
    when 1
      "little social interaction"
    when 2..3
      "some social interaction"
    when 4..5
      "spent a lot of time with friends and family"
    when 6..24
      "spent my whole day with friends and family"
    else
      "undefined"
    end
  end

  # Hobbies Time translation
  def translate_hobbies_time(time)
    case time
    when 0..1
      "some time for "
    when 2..3
      "much time for "
    when 4..5
      "lots of time for "
    when 6..24
      "spent my whole days on "
    else
      "undefined"
    end
  end

  # Mindfulness Time translation
  def translate_mindfulness_time(time)
    case time
    when 0
      "no time for mindfulness"
    when 1
      "some time for mindfulness"
    when 2
      "much time for mindfulness"
    when 3
      "lots time for mindfulness"
    when 4
      "spent my whole day on mindfulness"
    else
      "undefined"
    end
  end
end
