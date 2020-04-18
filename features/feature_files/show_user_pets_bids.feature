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

    Scenario: User request to shows all bids but he/she doesn't have any pets
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
            | 2  | Caty | available | url1,url2  | <cat>,<white> | 2           | 2        |
        When user with id '1' sends get request to show all bids of all pets that user owned
        Then json response is returned to the user with code 1, type 'user pets bids' and message 'User hasn\'t any pets'

    Scenario: User request to shows all bids but he/she one pet and this pet has one bid
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
            | 1  | Jac  | available | url1,url2  | <dog>,<black> | 1           | 1        |
            | 2  | Caty | available | url1,url2  | <cat>,<white> | 2           | 2        |
        And user pet bids with the following data are Created
            | user_id | pet_id | amount |
            | 1       | 2      | 500    |
            | 2       | 1      | 350    |
        When user with id '1' sends get request to show all bids of all pets that user owned
        Then json response is returned to the user with code 1, type 'user pets bids' and message ''
        And list of pets with size 1 returned to user and each pet has its bids
        And response message has the following pets with bids with the following size
            | pet_name | bids_size |
            | Jac      | 1         |


    Scenario: User request to shows all bids but he/she one pet and each pet has one bid
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
            | 1  | Jac  | available | url1,url2  | <dog>,<black> | 1           | 1        |
            | 2  | Caty | available | url1,url2  | <cat>,<white> | 2           | 1        |
        And user pet bids with the following data are Created
            | user_id | pet_id | amount |
            | 2       | 2      | 500    |
            | 2       | 1      | 350    |
        When user with id '1' sends get request to show all bids of all pets that user owned
        Then json response is returned to the user with code 1, type 'user pets bids' and message ''
        And list of pets with size 2 returned to user and each pet has its bids
        And response message has the following pets with bids with the following size
            | pet_name | bids_size |
            | Jac      | 1         |
            | Caty     | 1         |

    Scenario: User request to shows all bids but he/she one pet and the pet has two bids
        Given all tables data are cleared
        And users with the following data are Created
            | id | username | first_name | last_name | password | phone       | email          | user_status |
            | 1  | user1    | user       | one       | 4828     | 01025956985 | user1@test.com | 1           |
            | 2  | user2    | user       | two       | 4585     | 01245873256 | user2@test.com | 2           |
            | 3  | user3    | user       | three     | 9562     | 01244845154 | user3@test.com | 2           |
        And categories with the following data are Created
            | id | name  |
            | 1  | small |
            | 2  | large |
        And pets with the following data are Created
            | id | name | status    | photo_urls | tags          | category_id | owner_id |
            | 1  | Jac  | available | url1,url2  | <dog>,<black> | 1           | 1        |
            | 2  | Caty | available | url1,url2  | <cat>,<white> | 2           | 2        |
        And user pet bids with the following data are Created
            | user_id | pet_id | amount |
            | 2       | 1      | 500    |
            | 3       | 1      | 350    |
        When user with id '1' sends get request to show all bids of all pets that user owned
        Then json response is returned to the user with code 1, type 'user pets bids' and message ''
        And list of pets with size 1 returned to user and each pet has its bids
        And response message has the following pets with bids with the following size
            | pet_name | bids_size |
            | Jac      | 2         |


    Scenario: User request to shows all bids but he/she one pet and the pet has two bids
        Given all tables data are cleared
        And users with the following data are Created
            | id | username | first_name | last_name | password | phone       | email          | user_status |
            | 1  | user1    | user       | one       | 4828     | 01025956985 | user1@test.com | 1           |
            | 2  | user2    | user       | two       | 4585     | 01245873256 | user2@test.com | 2           |
            | 3  | user3    | user       | three     | 9562     | 01244845154 | user3@test.com | 2           |
            | 4  | user4    | user       | four      | 4896     | 01078926228 | user4@test.com | 2           |
            | 5  | user5    | user       | five      | 3487     | 01148962897 | user5@test.com | 2           |
            | 6  | user6    | user       | six       | 7854     | 01267677513 | user6@test.com | 2           |
        And categories with the following data are Created
            | id | name  |
            | 1  | small |
            | 2  | large |
        And pets with the following data are Created
            | id | name | status    | photo_urls | tags          | category_id | owner_id |
            | 1  | Jac  | available | url1,url2  | <dog>,<black> | 1           | 1        |
            | 2  | Caty | available | url1,url2  | <cat>,<white> | 2           | 1        |
        And user pet bids with the following data are Created
            | user_id | pet_id | amount |
            | 2       | 1      | 500    |
            | 5       | 1      | 350    |
            | 3       | 2      | 400    |
            | 4       | 2      | 600    |
            | 6       | 2      | 450    |
        When user with id '1' sends get request to show all bids of all pets that user owned
        Then json response is returned to the user with code 1, type 'user pets bids' and message ''
        And list of pets with size 2 returned to user and each pet has its bids
        And response message has the following pets with bids with the following size
            | pet_name | bids_size |
            | Jac      | 2         |
            | Caty     | 3         |
