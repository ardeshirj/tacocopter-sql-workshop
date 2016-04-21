# tacocopter-sql-workshop
- Connecting
- Schema
- Questions
- Search for Taco Shops

## Setup
```sh
bundle install
cp config/database.yml.example config/database.yml
# Update database.yml with your db configuration
rake db:setup
```

## Run
```sh
rails server
http://localhost:3000/
# 'Search for Taco Shops' section should be there
```

## Test
```sh
rspec spec
# Test coverage report is at: coverage/index.html
```

The site is deployed at Heroku in [here](https://limitless-sands-79414.herokuapp.com)

Slides are <a href=https://docs.google.com/presentation/d/1Y3gWwABlmSjAeZrBflAhUv-6m2nDRY8FYxvswJal4D0/edit?usp=sharing">here</a>

Written in Ruby on Rails. If you'd like to contribute, just open an issue or open a pull request and notify Brad Urani.
