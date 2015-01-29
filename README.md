#StudyBlocks


##About


StudyBlocks is a collaborative, online study platform that allows users to create and save decks of virtual flashcards.
Users can create cards using either text or images for the front of the card, and can pick from several response formats for the back of the card. Once the user has cards in a deck, they are ready to interact with it in exciting ways.
They can look at a study sheet, which displays both the front and back of the card together, as well as access the review page which hides the back of the card, yet allows the user to click and flip it to see the answer, should they choose.
Most importantly, users can take tests generated from their own cards. If users enroll in courses they are taking, they can also take tests based on their classmates' decks.
Working together, classmates can create more than enough study material to help each other succeed and forward each other's education.

##Features

* Cards are given a "format", which allows the user to dictate the method in which they are tested on the material. StudyBlocks currently supports full responses, response-by-field, true-or false, and multiple choice cards.
* Users have access to full study sheets, a review page for self-assessment, and an exam page where users put their own knowledge to the test.
* StudyBlocks saves users' tests and tracks their performance, displaying the data on interactive charts, allowing users to see their progress over time.
* Responses to individual tests can be viewed to better understand problem areas.
* StudyBlocks also offers registration with schools and courses, allowing users access to the decks of their classmates.
* School and course registration forms provide instant feedback matching the entered search.
* Cards can be imported into a deck from CSV files.
* Cards can be added and edited from with the deck add/edit forms.

##Implementations

###Backbone.View Extension

I was repeating myself. A lot. Every view needs to be rendered, otherwise it wouldn't be a view right?
I decided to DRY up a lot of the view code by extending the Backbone.View class to handle all rendering logic.
I created a renderThis object which every view could define with the models it needed to render.
I also created preRender, postRender, and onDOM hooks that a view could use to hook into the render process at that phase to implement unique behavior.
This greatly improved the pace at which I could write views while still allowing me full flexibility to implement custom logic.

###CollectionView

This project is chock-full of nested collections. Decks have cards, tests have responses, schools have courses, and so on.
The typical user-post-comment resources do not **need** each other to be functional. A user can view posts without writing any, and a post can be viewed without a single comment.
A deck meant for studying is fairly meaningless without flashcards, as is a test without the submitted responses. These factors affected the entire design and direction of StudyBlocks.
I wrote a parent view class, CollectionView, which implements the collection view pattern for rendering constituent models. Put simply, this means that every model represented on the page has its own view dictating its behavior.
Creating this structure in the front-end allowed me to respond to behavior at the individual level, the collection level, and the parent model level.
Without the CollectionView class, certain features, such as the ability to edit/add cards from **within** the deck edit form, without submitting the card changes OR the deck changes immediately, would have been a struggle to implement.
Additionally, even simple modifications or additions on a deck's page would force a full re-render of the entire collection at the very least.
Considering the likely size of the average deck, and the prevalence of images on cards, a full re-render would be a major blow to performance and usability.
Creating this functionality as a parent class allowed me to, combined with my Backbone.View extension, greatly DRY up my code and streamline the expansion of the project.

###Searches
The searches are a truly full-stack feature. On every key-press a GET request is fired to the API's custom search route.
Using the pg_search gem, I then search across all columns of the inspected relation. Once all the matching results are gathered they are returned to the client in JSON form.
An empty collection is continually cleared and repopulated with these results, creating and destroying its subviews as necessary to report only the most recently returned results.
All told, these factors combined allow for a search that instantly responds to user input, giving them rapid feedback about the state and content of their search.
To bring it together, the focusout event on the search form will instantly highlight the first option in the list, indicating the user should ensure they actually select a specific course/school.

###Imports
I have it super easy. I can seed my database whenever I want, allowing me to add decks and cards en masse.
A user may want this sort of convenience as well. This makes it easy to incorporate work accomplished in an offline state with the rest of a user's material.
Additionally, allowing for imports greatly reduces the cost of switching to StudyBlocks from a different platform.
Incorporating the Ruby CSV module, uploading CSV files of cards, with or without images, became a painless matter.
Once the CSV data is sent to the custom import route, it is parsed into an ordinary Ruby array, matched with a regular expression to determine if the front of each card is text or an image, and promptly saved to the database.

###Authentication
I like having flexibility in my interactions with the world. I also like not being punished for forgetting my username.
To that end I allowed users to sign in with either their username OR email.
I accomplished this by creating a custom SQL query to the database searching for either a username or an email that matched the submitted string.
Only after a user is found is the submitted password compared to that user's password digest using BCrypt.
For even easier registration/login, users can use their gmail accounts.
In the event they have already registered an account using that email, the two accounts will be linked and the user will have access to all materials they had previously created.
Additionally, all sessions are stored in their own table, meaning a user can access their account from anywhere even if they are already logged in on a different device.

##TODO

###Gamification
I believe that one of the best ways to encourage earnest study and collaboration is actually (friendly) competition.
The next major addition to StudyBlocks will be a head-to-head, real-time, knowledge-throwdown game in the same vein as QuizUp and Trivia Crack.
Like the ordinary tests, questions will be generated from both user's decks, and the responses/results will be stored in the database for post-game analysis (boasting).
The meat of the game however will use the websocket protocol to communicate with a node.js server which will in turn transmit information in real-time to each player.
Using full-duplex communication is the only way to achieve the in-the-moment experience that would really make the game a competitive experience.
Imagine I asked you to define full-duplex. How would you feel when halfway through your sentence you see that your opponent already answered, and correctly at that.
Good thing you can send them back some trash-talk, in real-time.
