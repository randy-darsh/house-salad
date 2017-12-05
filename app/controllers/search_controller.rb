class SearchController < ApplicationController
  def index
    conn = Faraday.new(url: "https://api.propublica.org/congress/v1/members/house/CO/current.json")
    response = conn.get do |req|
      req.headers['X-API-Key'] = ENV["PROPUBLICA_API_KEY"]
    end
    raw_members = JSON.parse(response.body, symbolize_names: true)[:results]
    @members = raw_members.map do |raw_member|
      Member.new(raw_member)
    end
  end
end
