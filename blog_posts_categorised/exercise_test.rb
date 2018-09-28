# frozen_string_literal: true

##
# This test file is for https://github.com/rabid/activerecord-exercises/tree/master/blog_posts_categorised.
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

# A test class for https://github.com/rabid/activerecord-exercises/tree/master/blog_posts_categorised.
class BlogPostCategorisedTest < ActiveSupport::TestCase
  self.use_transactional_tests = true

  def test_creates_post_with_category
    category = create_category
    post = create_post(category: category)
    assert_equal post.category.name,
                 category.name,
                 'Category saved against post'
  end

  def test_lists_categories
    Category.destroy_all
    categories = (1..5).map do |num|
      create_category(name: "Category #{num}")
    end
    assert_equal Category.order(name: :asc).pluck(:name),
                 categories.map(&:name),
                 'Categories are listed'
  end

  def test_lists_posts_for_category
    category = create_category
    posts = (1..5).map do |num|
      create_post(title: "Post #{num}", category: category)
    end

    assert_equal category.posts.order(title: :asc).pluck(:title),
                 posts.map(&:title),
                 'Posts for a category are listed'
  end

  def test_removes_post_from_category
    category = create_category
    post = create_post(category: category)
    category.posts.delete(post)
    assert_empty category.posts, 'Category has no posts left'
    assert post.persisted?, 'Post still exists'
  end

  private

  def create_category(attrs = {})
    Category.create!({ name: 'Test Category' }.merge(attrs))
  end

  def create_post(attrs = {})
    default_attrs = { title: 'Test Post', content: 'Test Post Content' }
    Post.create!(default_attrs.merge(attrs))
  end
end
