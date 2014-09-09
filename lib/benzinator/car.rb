require 'faraday'
require 'json'

API_URL = "http://www.bensbenzes.com/api/v1/cars/active"

module Benzinator
  class Car
    attr_reader :id, :make, :model, :year, :color, :vin, :dealer_id

    def initialize(attributes)
      @id = attributes["id"]
      @make = attributes["make"]
      @model = attributes["model"]
      @year = attributes["year"]
      @color = attributes["color"]
      @vin = attributes["vin"]
      @dealer_id = attributes["dealer_id"]
    end

    def self.find(id)
      response = Faraday.get("#{API_URL}/#{id}")
      attributes = JSON.parse(response.body)
      new(attributes)
    end

    def self.all
      response = Faraday.get(API_URL)
      cars = JSON.parse(response.body)
      cars.map do |attributes|
        new(attributes)
      end
    end
  end
end
