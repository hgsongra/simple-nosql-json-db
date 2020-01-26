require "minitest/autorun"
require "./lib/helper"
include Helper

class TestHelper < Minitest::Test
  def test_args_not_missing
    assert_equal args_missing?(["name=hitesh"]), false
  end

  def test_args_missing
    assert_raises SystemExit do 
      args_missing?([])
    end
  end
end