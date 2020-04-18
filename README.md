# petstore-assessment-task

# Setup
you should follow the next steps to setup and run the project
- clone the repo and cd to it
 -  docker-compose build
- docker-compose run web rake db:create
- docker-compose run web rake db:migrate
- docker-compose up
- docker-compose run web rake db:seed

to run testcases, you should write those command 
- docker-compose exec web rspec to run unit test
- docker-compose exec web cucumber to run integration test


those commands should be run after run 'docker-compose up

# Technologies
- Docker compose
- Postgresql
- Ruby on Rails 5 (API only)
- Cucumber (for integration tests)
- Rspec (for unit tests)

# Notes
after running the seeds,you can use: 

- users with ids [1, 2] 
- categories with ids [1,2]
- pets with ids [1,2]
