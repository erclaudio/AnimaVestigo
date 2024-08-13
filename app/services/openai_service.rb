require 'openai'

class OpenAIService
  def initialize
    @client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])
  end

  def generate_help_message(user_prompt)
    response = @client.chat(
      parameters: {
        model: "gpt-4", # Or the model you prefer
        messages: [
          { role: "system", content: "You are a helpful assistant." },
          { role: "user", content: user_prompt }
        ],
        max_tokens: 150
      }
    )
    response['choices'][0]['message']['content'].strip
  rescue StandardError => e
    Rails.logger.error("OpenAI API Error: #{e.message}")
    "I'm sorry, I couldn't generate a help message at this time."
  end
end
