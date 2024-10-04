@login
Feature: This feature file will be used to test the login related scenarios

    Background: Launch app
        Given I have launched the swag labs application

    @login_success
    Scenario: Login Success
        When I enter the correct username and password
        And I click on the login button
        Then I should land on the products page

    @login_failed
    Scenario: Login Failure
        When I enter the incorrect username and password
        And I click on the login button
        Then I should get the error message "Epic sadface: Username and password do not match any user in this service"

    @datadriven
    Scenario: Login failure using data driven
        When I enter the username as "standard_user"
        And I enter the password as "..."
        And I click on the login button
        Then I should get the error message "Epic sadface: Username and password do not match any user in this service"

    @lockeduser
    Scenario: Login failure for locked out user
        When I enter the username as "locked_out_user"
        And I enter the password as "secret_sauce"
        And I click on the login button
        Then I should get the error message "Epic sadface: Sorry, this user has been locked out."

    @examples
    Scenario: Login failure tests using examples
        When I enter the username as "<Username>"
        And I enter the password as "<Password>"
        And I click on the login button
        Then I should get the error message "<ErrorMessage>"

    Examples:
        | Username        | Password     | ErrorMessage                                                              |
        | standard_user   | ...          | Epic sadface: Username and password do not match any user in this service |
        | locked_out_user | secret_sauce | Epic sadface: Sorry, this user has been locked out.                       |
