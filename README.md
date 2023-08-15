# Weather App

Weather App is a Ruby on Rails application that provides weather information for any city. Users can sign in and search for the weather conditions of a particular city. The app integrates with the OpenWeatherMap API to fetch the latest weather data.

## Features

- User Authentication (sign in) without using any gems or libraries.
- Search for weather by city name.
- Integration with the OpenWeatherMap API.

## Prerequisites

- Ruby version: (Your Ruby version here, e.g., 2.7.1)
- Rails version: (Your Rails version here, e.g., 6.1.3)

## Setup

### API Key

You'll need to have an OpenWeatherMap API key to fetch the weather data. Set up the API key as an environment variable:

\```zsh
export OPENWEATHERMAP_API_KEY='your-api-key-here'
\```

### Installation

Clone the repository:

\```zsh
git clone https://github.com/yourusername/WeatherApp.git
\```

Navigate to the project directory:

\```zsh
cd WeatherApp
\```

Install the required dependencies:

\```zsh
bundle install
\```

Set up the database:

\```zsh
rails db:create
rails db:migrate
\```

Start the server:

\```zsh
rails server
\```

The application will now be accessible at [http://localhost:3000](http://localhost:3000).

## Testing

This project uses RSpec for testing. To run the tests:

\```zsh
rspec
\```
