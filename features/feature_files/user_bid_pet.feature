Feature: in this feature file, there are many scenarios that user sends a post request to bid pet
    Scenario: Created user pet bid with empty user_id
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
        When user with id '' sends a post request to bid pet with id '1' with amount '500'
        Then json response is returned to the user with code 0, type 'user bid pet' and message 'user_id should be provided'

    Scenario: Created user pet bid with empty pet_id
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
        When user with id '1' sends a post request to bid pet with id '' with amount '500'
        Then json response is returned to the user with code 0, type 'user bid pet' and message 'pet_id should be provided'

    Scenario: Created user pet bid with empty amount
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
        When user with id '1' sends a post request to bid pet with id '1' with amount ''
        Then json response is returned to the user with code 0, type 'user bid pet' and message 'amount should be provided'

    Scenario: Created user pet bid with invalid user_id
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
        When user with id '15' sends a post request to bid pet with id '1' with amount '500'
        Then json response is returned to the user with code 0, type 'user bid pet' and message 'user_id should be valid id'

    Scenario: Created user pet bid with invalid pet_id
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
        When user with id '1' sends a post request to bid pet with id '15' with amount '500'
        Then json response is returned to the user with code 0, type 'user bid pet' and message 'pet_id should be valid id'

    Scenario: Created user pet bid with invalid amount
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
        When user with id '1' sends a post request to bid pet with id '1' with amount '0'
        Then json response is returned to the user with code 0, type 'user bid pet' and message 'amount should be greater 0'

    Scenario: Created user pet bid with user that owned the pet
        Given all tables data are cleared
        And users with the following data are Created
            | id | username | first_name | last_name | password | phone       | email          | user_status |
            | 1  | user1    | user       | one       | 4828     | 01025956985 | user1@test.com | 1           |
        And categories with the following data are Created
            | id | name  |
            | 1  | small |
            | 2  | large |
        And pets with the following data are Created
            | id | name | status    | photo_urls | tags          | category_id | owner_id |
            | 1  | Jac  | available | url1,url2  | <dog>,<black> | 1           | 1        |
        When user with id '1' sends a post request to bid pet with id '1' with amount '500'
        Then json response is returned to the user with code 0, type 'user bid pet' and message 'user can not bid the pet because the user is the owner of this pet'

    Scenario: Created user pet bid with valid data
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
        When user with id '1' sends a post request to bid pet with id '1' with amount '500'
        Then json response is returned to the user with code 1, type 'user bid pet' and message 'user bid is created on the pet'
