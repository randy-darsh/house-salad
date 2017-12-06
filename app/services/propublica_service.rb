class PropublicaService
  def initialize
    @connection = Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.headers['X-API-Key'] = ENV['PROPUBLICA_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end

  def members_by_state(state)
    get_json("/congress/v1/members/house/#{state}/current.json")[:results]
  end

  private

  attr_reader :connection

  def get_json(url)
    response = connection.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
