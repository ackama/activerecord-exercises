# frozen_string_literal: true

##
# This test file is for https://github.com/rabid/activerecord-exercises/tree/master/blog_posts.
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

# A test class for https://github.com/rabid/activerecord-exercises/tree/master/blog_posts.
class BlogPostTest < ActiveSupport::TestCase
  self.use_transactional_tests = true

  def test_list_posts
    Post.destroy_all
    create_post
    assert Post.count == 1, 'List of posts was correct'
  end

  def test_create_post
    assert create_post.persisted?, 'Post was created'
  end

  def test_updates_post
    post = create_post
    post.update!(title: 'Updated Post')
    assert_equal post.title, 'Updated Post', 'Post was updated'
  end

  def test_removes_post
    post = create_post
    post.destroy
    refute post.persisted?, 'Post was destroyed'
  end

  private

  def create_post
    Post.create(title: 'Test Post', content: 'Test Post Body')
  end
end
