const { Given, When, Then } = require("@badeball/cypress-cucumber-preprocessor")

function enterCredentials(username, password) {
    const username_field = '#user-name';
    const password_field = '#password';

    cy.get(username_field).type(username);
    cy.get(password_field).type(password);
}

Given("I have launched the swag labs application", function() {
    cy.visit('https://www.saucedemo.com/v1/index.html');
});

When("I enter the correct username and password", function() {
    enterCredentials('standard_user', 'secret_sauce')
})

When("I click on the login button", function() {
    const login_button = '#login-button';
    cy.get(login_button).click();
})

Then("I should land on the products page", function() {
    cy.get('div.product_label').should('have.text', 'Products');
})

When(`I enter the incorrect username and password`, () => {
    // [When] Describes the action or event that triggers the scenario.
    enterCredentials('non_existent_username', 'non_existent_password')
});

Then(`I should get the error message {string}`, (message) => {
    // [Then] Describes the expected outcome or result of the scenario.
    const error_message_container = '#login_button_container > div > form > h3'
    cy.get(error_message_container).should('have.text', message)
});

When(`I enter the username as {string}`, (username) => {
    const username_field = '#user-name';
    cy.get(username_field).type(username);
});

When(`I enter the password as {string}`, (password) => {
    const password_field = '#password';
    cy.get(password_field).type(password);
});
