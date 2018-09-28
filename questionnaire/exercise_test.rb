# frozen_string_literal: true

##
# This test file is for https://github.com/rabid/activerecord-exercises/tree/master/questionnaire.
# It is intended to test the acceptance criteria for the exercise.
#
# YOU WILL NEED TO CHANGE THIS FILE YOURSELF IN MOST CASES FOR
# THESE TESTS TO PASS.
#
# A note on testing frameworks:
#
# In most cases we recommend testing with RSpec, as this testing library
# provides a number of convenient helpers and a nice consistent way of
# organising tests.
#
# To tests these exercises, we are testing with Test::Unit (via Minitest).
# Test::Unit is built into a default Rails install, so no additional gems
# need to be added to get started. There's no strong differences between
# the two in terms of readability. If you wish, you can install and configure
# `gem "rspec-rails"` in your own application, and rewrite these tests in the
# RSpec style.

require_relative 'test_helper'

# A test class for https://github.com/rabid/activerecord-exercises/tree/master/questionnaire.
class QuestionnaireTest < ActiveSupport::TestCase
  self.use_transactional_tests = true

  # * A new questionnaire can be created
  # * Questions can be added to the questionnaire
  # * Answers can be added to each question
  # * A user can answer questions on the questionnaire
  # * A list of questions can be accessed on the questionnaire
  # * A list of available answers can be accessed for each question
  # * A list of response can be accessed for each question
  # * (Semi-extension): A list of responses can be accessed across the
  #   entire questionnaire
end
