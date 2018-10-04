Submissions
====

## Scenario:

You are creating a moderated platform for users to create submissions. Submissions are short pieces
of content that are reviewed before being published. At this stage, consider submissions to be text 
content only.

## Acceptance Criteria:

In a Rails console:

* A submission can be recorded against a user
* A submission can be updated
* The user for a submission can be changed
* A submission can be marked as 'published'
* All published submissions can be retrieved using an ActiveRecord scope
* All unpublished submissions can be retrieved using an ActiveRecord scope
* All published submissions for a user can be retrieved using a scope and an association

## Extensions:

> Extensions represent additional tasks you can complete if you would like to try out a few more
> things. The acceptance criteria does not have tests included, but you are welcome to write them 
> to the test file yourself.

Consider how you could keep track of who published a submission. This goes further than a simple 
association, since you'll also need to consider the best way of telling the difference between a 
moderator and a user. 

Acceptance criteria:

In a Rails console:

* Given a submission exists
* When the submission is published, the publishing user can be passed in as an arguemnt
* Then the submission is marked as published
* And the publishing user can be accessed against the submission

In a paired code review session:

* Discuss and explain the different ways that 'publishing users' could be modelled in the application, and why
  you chose the approach you did.
* Discuss and explain the different ways you can mark a submission as published and the advantages and disadvantages
  of each (hint: any time you are introducing a `do_something!` method and `do_something?` method, there are different 
  ways of storing that flag in the database)
