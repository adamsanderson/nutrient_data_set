require 'minitest/autorun'
require_relative '../lib/nutrient_db'

class ParserTest < MiniTest::Unit::TestCase
  attr_reader :parser
  
  def setup
    @parser = NutrientDb::Parser.new("test/fixtures/FOOD_DES.txt")
  end
  
  def test_reads_strings_from_data_file
    record = parser.first
    description = record[:description]
    
    assert_equal "Butter, salted", description
  end
  
  def test_reads_integers_from_data_file
    record = parser.first
    refuse = record[:percent_refuse]
    
    assert_equal 0, refuse
  end
  
  def test_reads_floats_from_data_file
    record = parser.first
    factor = record[:calorie_factor]
    
    assert_equal 3.87, factor
  end
  
  def test_reads_multiple_records
    count = parser.count
    
    assert_equal 10, count
  end
  
end