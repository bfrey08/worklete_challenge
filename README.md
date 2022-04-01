## About

Worklete Coding Challenge with the following directions:

```
Coding challenge

We want our coding challenge to mirror the type of work going on at Worklete, and reporting on course completion is a huge part of our company. Show us what you’ve got by creating a tool to live-report progress and completion of a user’s quizzes.



We have two main roles: learners and managers. Course completion reports are used by managers to track participation amongst learners, and are used to assess whether a specific learner is at risk for injury.



As learners using the Worklete app complete a questionnaire, we want managers to be able to see their progress in real-time. Create a Ruby on Rails application that:

                * has 2 roles: learners and managers

                                * you do not need to do any form of authentication as part of the initial setup; session IDs, or another ID of your choosing is fine

                * delivers a quiz of 3 true or false questions to the learner role

                * learners should be given instant feedback when they submit their question that tells them whether their answer was correct

                * reports a learner’s progress in real-time; a manager should be able to open the app and see what the learner’s current progress in the quiz is

                * when a learner completes the quiz, a manager should be able to see a report showing the learner’s scores on the quiz



BONUS:

                * set up some kind of basic authentication

                * use a frontend library like React

                * the application should allow multiple learners to take the quiz

                * the application should allow managers to see average scores for a team of learners

                * show off your CSS skills



What we are looking for

We ask that you take no more than 4hrs to complete this code challenge. We are interested in seeing your thought process and how you work over completion of all tasks.



Please add thoughtful commit messages as you work on this, so that we can better understand how you tackled the challenge; this helps us understand how you communicate.
```

## Setup


 - Clone the repo on local
 - Install gem packages: `bundle install`
 - Setup the database: `rails db:{drop,create,migrate,seed}`
 - Run `bundle exec rspec` to test
 - Run `rails s` to start server
 - Navigate browser to `localhost:3000` for live view
 ```
 Manager login:
 Username: manager@test.com`
 Password: testing

 Learner login:
 Username: learner@test.com
 Password: testing

 Second learner login:
 Username: learner2@test.com
 Password: testing

 ```

## Technology used
- Ruby 2.7.2
- Rails 5.2.6
- PostgreSQL
- RSpec
- Shoulda matchers
- Capybara
- Bcrypt
- Bootstrap


## 4 Hour Completion point
At the end of 4 hours I have completed 7/10 tickets for functionality. If I was to continue working on the project I would complete the last 3 features

- Finish the Learner_quizzes show page
- Manager_quizzes show page
- Manager_quizzes index page


After the MVP was complete I would circle back and finish the following:

- Add authorization to all required pages
- Styling
- Add an "average_score" function to the manager model that allows you to see the average score of all quizzes associated with that manager
