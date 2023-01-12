# frozen_string_literal: true

require "test/unit"
require "zoom"

class SearchTest < Test::Unit::TestCase
  # Walter McGinnis, 2007-08-06
  # for some reason the result as string has an extra \n at the end
  # that now needs to be trimmed off the end
  # by doing this with a gsub for replacing \n\n pattern with a single \n
  # if this changes back to a single \n in the future
  # this shouldn't break
  def test_search_results
    ZOOM::Connection.open("z3950.loc.gov", 7090) do |conn|
      conn.database_name = "Voyager"
      conn.preferred_record_syntax = "USMARC"
      result_set = conn.search("@attr 1=7 0253333490")
      assert_equal 1, result_set.length
      assert_equal File.read("test/record.txt"), result_set[0].to_s.gsub("\n\n", "\n")
      assert_equal File.read("test/record.dat"), result_set[0].raw
    end
  end

  # Jason Ronallo, 2007-09-20
  # With libyaz3 3.0.12 threading fails for gem at
  # point of retrieving a record out of a result set.
  # libyaz3 3.0.10 worked fine.
  # Update: 3.0.14 fixes the problem.
  def test_thread
    thread = Thread.new do
      ZOOM::Connection.open("z3950.loc.gov", 7090) do |conn|
        conn.database_name = "Voyager"
        conn.preferred_record_syntax = "USMARC"
        result_set = conn.search("nature")
        array = result_set[0, 6] # change the 2nd number
        assert_equal 6, array.length # change the number
      end
    end
    thread.join
  end

  # Terry Reese 9-17-07
  # Test for batch results
  def test_search_batch_test
    ZOOM::Connection.open("z3950.loc.gov", 7090) do |conn|
      conn.database_name = "Voyager"
      conn.preferred_record_syntax = "USMARC"
      result_set = conn.search('@attr 1=4 "Oregon"')
      records = result_set[0..10]
      assert_equal 10, records.length
    end
  end
end
