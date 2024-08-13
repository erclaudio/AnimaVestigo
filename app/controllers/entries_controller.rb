class EntriesController < ApplicationController
  before_action :require_user_logged_in!

  def index
    @entries = Current.user.entries
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Current.user.entries.build(entry_params)
    if @entry.save
      redirect_to entries_path, notice: 'Entry was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @entry = Current.user.entries.find(params[:id])
    @entry.destroy
    redirect_to entries_path, notice: 'Entry was successfully deleted.'
  end

  private

  def entry_params
    params.require(:entry).permit(:name, :link, :content, :mood_rating, :sleep_quality_hours, :sleep_quality_rating, :exercise_type, :exercise_intensity, :skipped_meals, :anxiety_level, :stress_level, :energy_level, :happiness, :work_hours, :social_interactions_time, :hobbies_time, :mindfulness_time, :unexpected_changes, :journaling_thoughts, :positive_affirmations, :notable_dreams)
  end

  def show
    @entry = Entry.find(params[:id])
    prompt = generate_user_prompt(@entry)  # Generate the prompt using the helper method
    @help_message = OpenAIService.new.generate_help_message(prompt)
  end

  def generate_suggestion
    entry = Entry.find(params[:entry_id])
    prompt = generate_user_prompt(entry)
  
    client = OpenAI::Client.new
    response = client.chat(
      parameters: {
        model: "gpt-4", # or your preferred model
        messages: [{ role: "user", content: prompt }],
        max_tokens: 100
      }
    )
  
    suggestion = response.dig("choices", 0, "message", "content")
  
    # Now, you can redirect back to the entry show page with the suggestion
    redirect_to entries_path, notice: "Suggestion generated: #{suggestion}"
  end
  
end
