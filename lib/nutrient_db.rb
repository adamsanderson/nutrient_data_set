module NutrientDb
  def self.metadata
    @metadate ||= Metadata.new
  end
end

require_relative './nutrient_db/parser'
require_relative './nutrient_db/metadata'