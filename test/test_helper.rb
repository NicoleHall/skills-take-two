ENV['RACK_ENV'] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'capybara'
require 'tilt/erb'

class Minitest::Test
  def teardown
    SkillInventory.delete_all
  end
end

Capybara.app = SkillsInventoryApp

class FeatureTest < Minitest::Test
  include Capybara::DSL
end
