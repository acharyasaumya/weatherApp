class WeathersController < ApplicationController
  before_action :set_weather, only: [:show]

  def show
  end

  private

  def set_weather
    city = params['city']
    response = fetch_weather(city)
    Rails.logger.info("resp is #{response}")
    @weather = JSON.parse(response.body)
  rescue => e
    log_error(e)
    redirect_to root_path, alert: 'An error occurred while retrieving weather information. Please try again.'
  end

  def fetch_weather(city)
    url = "http://api.openweathermap.org/data/2.5/weather"
    api_key = ENV['OPENWEATHERMAP_API_KEY']
    query = { q: city, appid: api_key }
    HTTParty.get(url, query: query)
  rescue => e
    log_error(e)
    raise 'An error occurred while fetching the weather data.'
  end

  def log_error(e)
    Rails.logger.error e.message
    Rails.logger.error e.backtrace.join("\n")
  end
end

