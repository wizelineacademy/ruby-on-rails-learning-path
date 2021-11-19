# frozen_string_literal: true

require 'httparty'

class RequestAPI
  include HTTParty

  def initialize(api_url)
    @api_url = api_url
  end

  def all(limit = 100)
    results = []

    records = [1]
    next_call = "#{@api_url}/?limit=#{limit}"

    while records && next_call
      records, next_call = call(next_call)
      results.concat records if records
    end
    results
  end

  def call(next_call)
    response = self.class.get("#{next_call}/", format: :json)
    if response.code == 200
      body = JSON.parse(response.body)

      return body['results'], body['next']
    end
    [nil, nil]
  end

  def get_record(id)
    response = self.class.get("#{@api_url}/#{id}", format: :json)
    if response.code == 200
      body = JSON.parse(response.body)

      return body
    end
    nil
  end
end
