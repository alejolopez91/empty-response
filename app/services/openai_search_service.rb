class OpenaiSearchService
  attr_reader :client

  def initialize
    @client = OpenAI::Client.new(access_token: ENV[:OPENAI_ACCESS_TOKEN])
  end

  def self.search(promt)
    new.search(promt)
  end

  def search(prompt)
    response = client.chat(
      parameters: {
          model: "gpt-3.5-turbo",
          messages: [{ role: "user", content: prompt}],
          temperature: 0.7,
      })

    response.dig("choices", 0, "message", "content")
  end
end
