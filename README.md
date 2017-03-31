# Cocktail Finder CLI App


## Intro
We have built a CLI app that communicates with an API created by Absolut Vodka. With our app, a user can enter the name of a cocktail and receive back a list of ingredients and the instructions to make the cocktail.

Also, a user can input an ingredient and see a collection of cocktails that include that ingredient. Because there are some ingredients that are in hundreds or even thousands of ingredients, we have throttled these responses to 3 different drinks.

Our hope is that we can inspire users to imbibe in responsible and sophisticated ways. Artisanal cocktails have never been more popular, so we have empowered users to learn more about those drinks they have heard about but never knew about.

## Database
Our database has three tables; drinks, ingredients, and the join table drinks_ingredients. We are using the powerful ActiveRecord pattern to construct our associations based on the classes we defined.

#### Drinks Table
* Name
* Glass type
* Instructions

#### Ingredients Table
* Name

#### Join Table: Drink_Ingredients
* drink_id
* ingredient_id
* Portion


The portion data *must* be stored on the join table. We are only concerned with a particular measurement of an ingredient when it intersects with a particular drink recipe.

## Description
When a user inputs the name of cocktail, our program will first search the database for a drink that matches that name, regardless of case. If it finds a match, then it will return the relevant data back to the user.

If that request to the database returns nil, then that name is sent to the API. We are reaching into the API with precision to find only that drinks data. We pull that data down and organize it in our database. Then the program runs the same methods to display the relevant data back to the user.

If the drink name isn't found in our database OR the API, we return an error message back to the user and ask for another request.

The process for returning recipes based on ingredients is similar, with one key difference. We reach directly to the API for ingredients, because we don't want to limit the results to only those cocktails that already exist in our database.

Again, if the user's query doesn't match anything in the API, we display an error message. This is same abstracted error message with use with failed drinks.
