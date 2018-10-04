# Versioned Submissions

## Situation:

> This exercise builds upon the previous "submission" exercise. The new parts
> of this situation are highlighted in **bold**.

You are creating a moderated platform for users to create submissions. 
Submissions are short pieces of content that are reviewed before being published.
At this stage, consider submissions to be text content only.

**Submissions are versioned - that is, the content can be revised, and each time it
is edited, a new version is created. This helps users adjust their content before the 
final copy is published. It also allows features such as drafts to work.**

## Acceptance Criteria:

In a Rails console I can:

- Create a new submission with some initial content
- Check that the created submission has one version
- Create a new version of the submission's content
- Check that the created submission has two versions
- Mark the submission has marked the correct version as published
- Collect published content across a range of submissions

## Extensions

> Extensions represent additional tasks you can complete if you would like to try out a few more
> things. The acceptance criteria does not have tests included, but you are welcome to write them 
> to the test file yourself.

If you have completed the primary acceptance criteria, you technically can support drafts very easily. Complete the support for drafts by adding ActiveRecord scopes and helpers to support being able to look up the latest draft that has not necessarily been published.

### Acceptance criteria:

* Given a submission exists with an initial version, and another version that is published
* When a new version is created, but not published
* Then the count of draft submissions for the submission should be '2'
* And the 'latest version' scope/method should return the last unpublished version that was created.

---

Consider migrations in Rails - the migration files have a timestamp, but can be migrated or rolled back using a "STEP" environment variable. Add support for looking up versions of submission content using a similar mechanism - for example, allow finding the version based on an index from the current version, rather than a timestamp. This is quite easy to do using Ruby, but harder to do using a database query.

### Acceptance criteria:

* Given a submission with 10 versions exists, with the 5th submission being the published one
* When a submission with a step of -2 is passed in
* Then the 2nd version is returned
* And when a submission with a step of 2 is passed in
* Then the 7th version is returned

---

ActiveRecord is very well set up for creating a single record in a single call to `create`, `build`, etc. Using `accepts_nested_attributes_for` allows related records to be found, but it's not usually a good architectural choice - it's a slippery slope to having a single call to `create` actually create 15-20 related objects!

Try and consider a couple of different ways you could streamline the experience of 
creating a new version of the content for a submission without having to resort to normal ActiveRecord objects. This can delve into some more complex stuff, so if 
you're not too sure how to go about this, consider it an opportunity to pair with
another developer.

### Acceptance criteria:

* Given a submission is being created
* And `accepts_nested_attributes` is not being used
* Then the submission and a new version is created using a single method call

* Given a submission exists
* And `accepts_nested_attributes` is not being used
* When updated content is assigned to the submission
* Then a new version is created using a single method call

