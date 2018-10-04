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
  def test_creates_questionnaire
    questionnaire = build_questionnaire
    assert questionnaire.persisted?, 'Questionnaire was created'
  end

  # * Questions can be added to the questionnaire
  def test_adds_questions_to_questionnaire
    questionnaire = build_questionnaire
    3.times { questionnaire.questions << build_question }
    assert_equal questionnaire.questions.count, 3, 'Questionnaire has questions'
  end

  # * Answers can be added to each question
  def test_adds_answers_to_question
    questionnaire = build_questionnaire
    questionnaire.questions << question = build_question
    3.times { question.answers << build_answer }
    assert_equal question.answers.count, 3, 'Question has answers'
  end

  # * A user can answer questions on the questionnaire
  def test_question_can_be_answered
    questionnaire = build_questionnaire
    questionnaire.questions << question = build_question
    question.answers << answer = build_answer
    response = create_response(answer: answer)
    assert_equal answer.responses, [response], 
                 'Answer has expected responses'
  end

  def test_responses_can_be_accessed_for_a_question
    questionnaire = build_questionnaire
    questionnaire.questions << question = build_question
    3.times { question.answers << build_answer }
    10.times { create_response(answer: question.answers.sample) }
    assert_equal question.responses.count, 10, 
                 'Question has expected responses'
  end

  def test_responses_can_be_accessed_for_a_questionnaire
    questionnaire = build_questionnaire
    questionnaire.questions << question = build_question
    3.times { question.answers << build_answer }
    10.times { create_response(answer: question.answers.sample) }
    assert_equal questionnaire.responses.count, 10, 
                 'Questionnaire has expected responses'
  end

  private

  def build_questionnaire
    Questionnaire.create!(title: 'Test Questionnaire')
  end

  def build_question
    Question.new(title: "Question #{rand(1..999)}")
  end

  def build_answer
    Answer.new(label: "Answer #{rand(1..999)}")
  end

  def create_response(attrs = {})
    Response.create!(attrs)
  end
end
