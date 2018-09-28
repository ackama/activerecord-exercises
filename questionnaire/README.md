Questionnaire
====

## Scenario:

Hey quizmaster! You are creating an application to allow the completion of questionnaires.
Questionnaires have one or more multichoice questions. They should have a title, some content 
(to explain the question), and a number of answers available. 
Users respond to questions by selecting an answer.

## Acceptance Criteria:

In a Rails console:

* A new questionnaire can be created
* Questions can be added to the questionnaire
* Answers can be added to each question
* A user can answer questions on the questionnaire
* A list of questions can be accessed on the questionnaire
* A list of available answers can be accessed for each question
* A list of response can be accessed for each question
* (Semi-extension): A list of responses can be accessed across the entire questionnaire.


## Extensions:

> Extensions represent additional tasks you can complete if you would like to try out a few more
> things. The acceptance criteria does not have tests included, but you are welcome to write them 
> to the test file yourself.

Consider how you would create the possibility of an 'Other' answer. An 'Other' answer would need the
user to also provide the alternative answer as a string.

Acceptance criteria:

In a Rails console:

* Given a question with an "Other" answer exists
* When a user creates a response using the "Other" answer
* They can provide an alternative value (technically, the user should _have_ to provide an
  alternative value, but this requires validations which is not currently in the scope of these
  exercises)

In a paired code review session:

* Explain any and all of the different ways of setting up alternative answers
* Explain the selected approach and the advantages/disadvantages.

---

In the main scenario, it is presumed that any particular question can be left unanswered - that is,
a response is not required. For this extension, delve into the [ActiveRecord
validations](https://guides.rubyonrails.org/active_record_validations.html) guide, and consider how
validations might be added to require that all (or certain questions in a questionnaire are answered
by a user.

Acceptance criteria:

* Given a questionnaire exists
* And a question exists on the questionnaire (if you have added support for optional AND required
  questions, remember to mark at least one question as required)
* When a user does not select an answer for a required question
* Expect a validation message to be reported


