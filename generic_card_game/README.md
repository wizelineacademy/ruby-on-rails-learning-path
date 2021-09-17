# Pokemon TCG

This application is based on the popular `Pokemon Trading Card Game (TCG)`.

A player's objective is to complete their Pokemon collection by catching as many unique cards as possible.


## System requirements
- Ruby 2.7.2
- Rails 6.1.4
- PostgreSQL 13.4

## Configuration
1. Create a database and a user with access to it. Then edit `config/database.yml` accordingly
2. Go to `https://dev.pokemontcg.io/` and get a Dev API Key, then paste that key into `config/application.rb` (change the value for `config.api_key`)
3. Install all gems by running `bundle instal` in the root directory

## Run the application
1. Just execute the command `rails s` to start serving the application. By default it will listen to `http://localhost:3000`
