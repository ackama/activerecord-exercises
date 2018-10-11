# Versioned Submissions

## Situation:

> This exercise builds upon the previous "submission" exercise. The new parts
> of this situation are highlighted in **bold**.

You are creating a moderated platform for users to create submissions. 
Submissions are short pieces of content that are reviewed before being published.
At this stage, consider submissions to be text content only.

**As part of the moderation process for submissions, moderators have asked to be able to record one or more notes against a submission before it is published.**

## Acceptance Criteria:

In a Rails console I can:

- Given a submission, add a note against the submission
- Access all notes for a submission
- Access all notes from a particular user
- Delete a note (from submission and database)

## Extensions

> Extensions represent additional tasks you can complete if you would like to try out a few more
> things. The acceptance criteria does not have tests included, but you are welcome to write them 
> to the test file yourself.

Consider when notes may be used - they are usually recorded as part of the moderation process, but not once the submission is published. Try and define an API that can be used to determine if notes can still be added to a submission. As an extension to this extension, see if you can find an ActiveRecord way of marking an entire association as readonly, so that it is not possible to add notes to a published submission.

### Acceptance criteria:

* Given an unpublished submission 
* When the method to determine if a note can be added is run
* It returns boolean true

* Given a published submission
* When the method to determine if a note can be added is run
* It returns boolean false

---

When adding a new note to a submission, you wish to notify all the other users who have added notes to the submission of the new note. Add functionality to your models which use [ActionMailer](https://guides.rubyonrails.org/action_mailer_basics.html) to deliver a notification to the other uses. 

> While you initial inclination might be to add a callback to your note model, consider using a new object to try and keep your models clean. These objects should try and keep responsibilities of your models as small as possible.

### Acceptance criteria:

* Given a submission exists
* And notes are created by test1@example.com and test2@example.com
* When a note is created by test3@example.com
* Then test1@example.com receives a notification of the note
* And test2@example.com receives a notification of the note.
