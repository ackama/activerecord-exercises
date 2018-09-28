# frozen_string_literal: true

##
# This test file is for https://github.com/rabid/activerecord-exercises/tree/master/pages_with_parts.
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

# A test class for https://github.com/rabid/activerecord-exercises/tree/master/pages_with_parts.
class PagesWithPartsTest < ActiveSupport::TestCase
  self.use_transactional_tests = true

  # * A page can be created called "Home", with three parts:
  #   * Featured Content One
  #   * Featured Content Two
  #   * Featured Content Three
  #
  # * A new part can be built and attached to an existing page
  # * A part can be removed from an existing page
  # * All of the content can be collected from a page using "pluck"

  def test_creates_page_with_parts
    page = create_page
    page.parts.create(title: 'Featured Content One')
    page.parts.create(title: 'Featured Content Two')
    page.parts.create(title: 'Featured Content Three')

    assert_equal page.parts.count,
                 3,
                 'Page has the correct page pages associated'
  end

  def test_attach_part_to_page
    page = create_page
    part = PagePart.new(title: 'New Page Part')
    page.parts << part
    assert_equal part.page,
                 page, '
    Page Part is associated with the page'
  end

  def test_remove_part_from_page
    page = create_page
    part = page.parts.create(title: 'Deleted page page')
    page.parts.destroy(part)
    refute part.persisted?, 'Page part is removed from the DB'
    assert_empty page.parts, 'Page has no parts remaining'
  end

  def test_collect_page_content
    page = create_page
    page.parts.create(title: 'Test A', content: 'Content for Test A')
    page.parts.create(title: 'Test B', content: 'Content for Test B')
    assert_equal page.parts.pluck(:content),
                 ['Content for Test A', 'Content for Test B']
  end

  def test_get_content_for_part
    page = create_page
    page.parts.create(title: 'Test A', content: 'Content for Test A')
    assert_equal page.parts.find_by(title: 'Test A').content,
                 'Content for Test A'
  end

  private

  def create_page(attrs = {})
    default_attrs = { title: 'Home' }
    Page.create!(default_attrs.merge!(attrs))
  end
end
