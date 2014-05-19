require 'minitest/autorun'
require_relative '../lib/nutrient_data_set'

class NutrientDataSetTest < Minitest::Test
  attr_reader :data
  
  def setup
    @data = NutrientDataSet.new
  end
  
  def test_loads_data_for_known_file
    parser = data["nutr_def"]
    
    assert parser.count > 0
  end
  
  def test_raises_for_file_with_no_metadata
    assert_raises KeyError do
      data["unknown"]
    end
  end
  
  def test_defines_helper_methods
    parser = data.nutr_def
    
    assert parser.count > 0
  end
  
  def test_each_file_is_represented
    data_dir = NutrientDataSet::DATA_DIR
    
    data_files = Dir[data_dir+"/*.txt"]
    supported_files = NutrientDataSet::META_DATA.keys
    
    assert_equal data_files.length, supported_files.length, "Expected each data file to be represented in NutrientDataSet"
  end
  
  # This is a sledgehammer type of test, but at least it gives you some warning
  # if something is REALLY screwed up.
  def test_each_file_returns_data
    files = NutrientDataSet::META_DATA.keys
    files.each do |name|
      parser = data["nutr_def"]
      row    = parser.take(1)
      
      assert !row.empty?, "Expected data for #{name} to exist."
    end
  end
  
end
