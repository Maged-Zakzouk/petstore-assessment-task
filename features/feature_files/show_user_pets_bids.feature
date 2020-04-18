Feature: in this feature file, there are many scenarios that user sends post request to bid pet
    Scenario: User request to shows all bids of his/her pets with invalid user_id
        Given all tables data are cleared
        And users with the following data are Created
            | id | username | first_name | last_name | password | phone       | email          | user_status |
            | 1  | user1    | user       | one       | 4828     | 01025956985 | user1@test.com | 1           |
            | 2  | user2    | user       | two       | 4585     | 01245873256 | user2@test.com | 2           |
        And categories with the following data are Created
            | id | name  |
            | 1  | small |
            | 2  | large |
        And pets with the following data are Created
            | id | name | status    | photo_urls | tags          | category_id | owner_id |
            | 1  | Jac  | available | url1,url2  | <dog>,<black> | 1           | 2        |
        When user with id '15' sends get request to show all bids of all pets that user owned
        Then json response is returned to the user with code 0, type 'user pets bids' and message 'invalid user_id'