require 'minitest/autorun'
require_relative '../lib/nutrient_db'

class NutrientDbTest < Minitest::Test
  attr_reader :data
  
  def setup
    @data = NutrientDb.new
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
end
