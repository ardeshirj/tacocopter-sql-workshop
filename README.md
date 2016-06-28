Forked from [Procore github page](https://github.com/procore) for `Taco Shops` interview.

# Tacocopter SQL Workshop
- Connecting
- Schema
- Questions
- Search for Taco Shops - Added for `Taco Shops` interview

## Setup
```sh
bundle install
cp config/database.yml.example config/database.yml
# Update config/database.yml with your db configuration
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

The site is deployed at Heroku [here](https://limitless-sands-79414.herokuapp.com)
