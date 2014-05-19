require_relative 'lib/nutrient_db/version'

Gem::Specification.new do |s|
  s.name               = "nutrient_db"
  s.version            = NutrientDb::VERSION
  s.summary            = "Nutrient Database"
  s.description        = "Library for accessing the USDA National Nutrient Database for Standard Reference 26."
  s.email              = "netghost@gmail.com"
  s.authors            = ["Adam Sanderson"]
  s.date               = "2014-05-18"
  s.require_paths      = ["lib"]
  s.extra_rdoc_files   = ["README.markdown"]
  s.files              = Dir["{lib,data}/**/*"] + ["Rakefile", "README.markdown"]
  s.homepage           = "http://github.com/adamsanderson/nutrient_db"
  s.rdoc_options       = ["--charset=UTF-8"]
  s.licenses           = ["MIT"]
end