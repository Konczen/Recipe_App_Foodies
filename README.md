# READ HERE BEFORE STARTING
An explanation of this application and the structure of the code. An explanation in English comes first and afterwards in Swedish.

# Group 9
A group project of a university course called Programming for mobile devices (TIG169). Made by Group number 9 consisting of Jangdin, JohnLGU, fajonathan, larsenjulia, LeoEnocksson, and me (Konczen). 

## Description
An application that makes it possible to search for recipes using Spoonaculars API. It is possible to search for a recipe using names on the recipe and based on ingredients in the recipe. Aside from that it is also possible to get a random food joke and/or trivia from the API. 

## Structure
The folder-, file- and codestructure is based on the conventions in 'Effective Dart'. It is intended to give a clear picture for outsiders of how the code is built and also to make it easy to navigate through the different screens and functions of the app. The folders and files are divided into contents and properties where for example all screens are in a seperate folder called 'screens'. Based on the functionality of the different screens there could be other screens in the same folder, just as in the folder called 'search_views' where two different screens with similar functionality but different looks are placed in the same folder. Widgets that were used several times in different places have been seperated in a folders called 'widgets'.

    ├───lib
    │   ├───models
    │   ├───screens
    │   │   ├───focus_views
    │   │   ├───home_view
    │   │   ├───joke_trivia_view
    │   │   └───search_views
    │   │       └───widgets
    │   ├───service
    │   └───widgets
    └───test

## Functionality
The primary function of this application is to get recipes based on what the user enters in the search bar. There are two recipe lists that show different results based on what the user is looking for. The recipe list (recipe_search_view) shows results based on the name of the recipe while the other recipe list (ingredient_search_view) shows results based on what ingredients a recipe has. The thought process on this was to be able to search for whatever recipes the user wants to make or just to get some inspiration based on ingredients that for example are left in the fridge. When a recipe is clicked, information regarding the chosen recipe is shown e.g., recipe instructions, ingredients, time, etc. 

The secondary function of this application is to give the user an oppurtunity to get different food related jokes and trivia. All calls have a http-get-method with an API-key to be able to get the information needed. All the functions are using the API to work. 

## API
https://spoonacular.com/food-api/

## SWEDISH EXPLANATION

# Grupp 9
Ett projektarbete för TIG169 av Grupp 9 bestående av Jangdin, JohnLGU, fajonathan, larsenjulia, LeoEnocksson, och jag (Konczen). 

## Beskrivning
En applikation som gör det möjligt att söka efter recept från Spoonaculars API. Sökningen går att göras dels efter namn på recept, dels baserat på ingredienser. Utöver det går det även att hämta ett slumpmässigt skämt/kuriosa från API:et. 

Mapp-, fil- och kodstrukturen är utformad efter de konventioner som nämns i 'Effective Dart'. Strukturen är tänkt att ge en tydlig bild för utomstående över hur koden sitter ihop, samt göra det enkelt att navigera sig mellan appens olika funktioner och vyer. Mapparna och filerna är indelade efter innehåll och egenskaper, exempelvis ligger alla vyer i egna mappar under mappen 'screens'. Utifrån de olika vyernas funktionalitet kan flera vyer ligga i samma mapp, som i fallet med mappen 'search_views' där två vyer med liknande funktionalitet delar mapp trots att de har något annorlunda utseende. Återkommande widgets har brutits ut och placerats i egna mappar.

    ├───lib
    │   ├───models
    │   ├───screens
    │   │   ├───focus_views
    │   │   ├───home_view
    │   │   ├───joke_trivia_view
    │   │   └───search_views
    │   │       └───widgets
    │   ├───service
    │   └───widgets
    └───test

## Funktioner
Appens huvudfunktioner är att hämta recept baserade på vad användaren skriver in för värde. Det finns två olika receptlistor som visar olika resultat baserat på vad användaren efterfrågar. Receptlistan (recipe_search_view) visar resultat utifrån namnet på receptet skriver in medan den andrar receptfunktionen (ingredient_search_view) visar resultat utifrån de ingredienser som efterfrågas. Tanken är att både kunna söka upp recept på vad man vill tillaga samt på vad man själv har för ingredienser i hemmet. När man klickar på recepten får man upp information om tillvägagångssätt för tillagning steg för steg samt information om vilka ingredienser som behövs. 

Den sekundära funktionen i appen ger användaren en möjlighet att få tillgång till olika matrelaterade skämt och trivia. Alla anrop innehåller en http-get-metod med en API-nyckel för att kunna hämta information och möjliggöra dessa funktioner. Alla funktioner är hämtade från API:et nedan. 

## API
https://spoonacular.com/food-api/