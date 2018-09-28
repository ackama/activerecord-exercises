# ActiveRecord Exercises

Welcome!

This repository contains directories with exercises to attempt to broaden
yoru knowledge of ActiveRecord. Each directory contains a README with an abstract
description of the problem. Where possible, the directory will contain a template
test script that exercises your code.

## What kind of exercises?

At the moment, these exercises are focussed on associations and model structure, rather than
querying, validations, or any of the other parts of ActiveRecord. The reason for this is that
understanding how models work and how they relate to one another covers off a lot of what a
developer new to ActiveRecord needs to get started. It also focusses on data and database modelling,
which is a useful skill to develop regardless of which language or framework is being used.

## What do I need to get started?

You'll need a Ruby environment. I recommend the latest stable version of Ruby, which at
the time of writing is 2.5.1. You'll also need the Ruby on Rails gem installed.
With Ruby installed, this is a simple `gem install rails` away.

We don't provide a complete Rails app to start with for each exercise, since getting
all the way from a fresh Rails app to a complete exercise is a useful learning opportunity in
itself. If you're looking for a quick start, `rails new activerecord-exercise-blah` will
get you started quickly enough. You won't need any asset pipeline stuff, so feel free to
skip that if you'd like.

## What do I do if I'm stuck?

StackOverflow is great for some of these problems, others need a bit of thinking.
If you're stuck, I encourage you to try sketching or whiteboarding out the data structure
you have in mind to prototype it before you get stuck into code.

If you're starting out at a company, you may want to pair with a more experienced developer
if you're stuck. There may also be some reference code you can use for inspiration available!

## How do I know when I have completed exercises?

Each task specifies acceptance criteria. You can use these to decide if you have
satisfied the requirements. Some exercises also include automated tests. 

#### Running the automated tests:

The automated tests are written to demonstrate the core acceptance criteria, without
extensions. When you generate anew Rails application, you will see a `test` directory. Simply drop the `exercise_test.rb` file inside that directory and run `rake test` to see if the tests pass. Rails may prompt you to set up your database before the tests can be run.

Here is an example of commands used to run the tests for the first exercise:

* `cd blog_posts`
* `rails new blog --database=sqlite3 --skip-sprockets`
* `cp exercise_test.rb blog/test/`
* `cd blog`
* `rails db:create:all db:migrate test`

If you follow these steps, you'll get failing tests - that's good! You can now add your own code to get the tests passing.

## Can I use these exercises?

Sure! Check out `LICENSE` for details on any and all conditions attached to usage.
If you think up more exercises, pull requests are welcome!

## Who created these?

See `CONTRIBUTORS.md`
