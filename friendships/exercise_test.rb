# frozen_string_literal: true

##
# This test file is for https://github.com/rabid/activerecord-exercises/tree/master/friendships.
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

# A test class for https://github.com/rabid/activerecord-exercises/tree/master/friendships.
class FriendshipsTest < ActiveSupport::TestCase
  self.use_transactional_tests = true

  def test_become_friends
    person1 = create_person(name: 'Person A')
    person2 = create_person(name: 'Person B')
    friendship = create_friendship(person1, person2)
    assert friendship.persisted?, 'Friendship is created'
  end

  def test_find_friend
    person1 = create_person(name: 'Person A')
    person2 = create_person(name: 'Person B')
    friendship = create_friendship(person1, person2)
    assert_equal friendship.source,
                 person1,
                 'Person A became friends with Person B'
    assert_equal friendship.destination,
                 person2,
                 'Person B was friends with Person A'
  end

  def test_have_a_falling_out
    person1 = create_person(name: 'Person A')
    person2 = create_person(name: 'Person B')
    friendship = create_friendship(person1, person2)
    friendship.destroy
    refute person1.friends.include?(person2)
  end

  def test_manage_friends_directly
    person1 = create_person(name: 'Person A')
    person1.friends << create_person(name: 'Person B')
    assert_equal person1.friendships.size, 1
    assert_equal person1.friends.pluck(:name), ['Person B']
  end

  private

  def create_person(attrs = {})
    Person.create!(attrs)
  end

  def create_friendship(person1, person2)
    Friendship.create!(source: person1, destination: person2)
  end
end
