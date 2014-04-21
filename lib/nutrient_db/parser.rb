require 'csv'

class NutrientDb::Parser
  EXTERNAL_ENCODING = Encoding::ISO8859_1
  CONVERSIONS = {
    :num  => lambda{|v| v.to_f if v},
    :int  => lambda{|v| v.to_i if v},
    :bool => lambda{|v| v == "Y"   },
    :date => lambda do |v|
      if v
        m,y = v.split("/")
        Date.new(y.to_i, m.to_i)
      end
    end,
  }
  
  include Enumerable
  
  attr_reader :path

  def initialize(path)
    @path = path
  end
  
  def each
    CSV.foreach(path, :encoding => EXTERNAL_ENCODING, :col_sep => "^", :quote_char => "~", :headers => headers) do |row|
      yield convert(row)
    end
  end
  
  private
  
  def convert(row)
    conversions.each_with_index do |conversion, i|
      row[i] = conversion.call(row[i]) if conversion
    end
    
    row
  end
  
  def conversions
    @conversions ||= types.map{|type| CONVERSIONS[type] }
  end
  
  def headers
    NutrientDb.metadata[path].keys
  end
  
  def types
    metadata.values
  end
  
  def metadata
    @metadata ||= NutrientDb.metadata[path]
  end
  
end