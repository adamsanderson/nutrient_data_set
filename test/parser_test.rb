require 'minitest/autorun'
require_relative '../lib/nutrient_data_set'

class ParserTest < Minitest::Test
  attr_reader :parser
  
  def setup
    @parser = NutrientDataSet::Parser.new("test/fixtures/NUT_DATA.txt", NutrientDataSet::META_DATA["nut_data"])
  end
  
  def test_reads_strings_from_data_file
    record = parser.first
    id = record[:food_id]
    
    assert_equal "01001", id
  end
  
  def test_reads_integers_from_data_file
    record  = parser.first
    samples = record[:samples]
    
    assert_equal 16, samples
  end
  
  def test_reads_floats_from_data_file
    record = parser.first
    value  = record[:value]
    
    assert_equal 0.85, value
  end
  
  def test_reads_dates_from_data_file
    record = parser.first
    updated_at = record[:updated_at]
    
    assert_equal Date.new(1976, 11), updated_at
  end
  
  def test_reads_bools_from_data_file
    record = parser.first
    fort = record[:is_fortification]
    
    assert fort
  end
  
  def test_reads_multiple_records
    count = parser.count
    
    assert_equal 10, count
  end
  
end