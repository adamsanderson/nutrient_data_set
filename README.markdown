NutrientDataSet
==========

This is a very basic library for accessing the [USDA National Nutrient Database](http://ndb.nal.usda.gov/) (Standard Reference 26).  

Included is a vast amount of data concerning the nutrient content of various foods.  At the moment, there is little more than a parser for the data files, and a basic set of wrappers for converting the data into a useful format.  In its current state, this may be useful for populating a database, or running adhoc queries in Ruby.

Example Usage
-------------

List all the foods included in the nutrient data set:

    require 'nutrient_data_set'

    db = NutrientDataSet.new 
    db[:food_des].map do |food|
      id   = food[:id]
      desc = food[:description]

      puts "#{id}: #{description}"
    end
    
Find how much Calcium is in Feta Cheese:

    db = NutrientDataSet.new
    food = db[:food_des].find{|row| row[:name] =~ /feta/i }
    #=> #<CSV::Row id:"01019" food_group_id:"0100" description:"Cheese, feta" ... >
    
    nutrient = db[:nutr_def].find{|row| row[:name] =~ /calcium/i }
    #=> #<CSV::Row id:"301" units:"mg" tag_name:"CA" name:"Calcium, Ca" decimals:0 sort_order:5300> 
    
    calcium = db[:nut_data].find{|row| row[:food_id] == food[:id] && nutrient[:id] == nutrient[:id]}
    #=> #<CSV::Row food_id:"01019" nutrient_id:"203" value:14.21 samples:9 std_error:0.515 ... >
    
    puts "#{calcium[:value]}g of Calcium per 100g of Feta."
    "14.21g of Calcium per 100g of Feta."
    
This is not a database, in fact it's not that friendly to use, but should you want to load this into a SQL database, wrap this in ActiveModel, query it with Elastic Search, or do something else interesting, now you're 5% of the way there.

Data and Documentation
----------------------

I've tried to give everything idiomatic and sensible names for use in Ruby.  To find out more about all the data, look in the `data` directory.  The full documentation for the dataset is contained in the PDF.  See `lib/nutrient_data_set` for all the mappings.


---

This library is available under the MIT License, the data is published by the [USDA](http://ndb.nal.usda.gov/).

[Adam Sanderson](netghost@gmail.com), http://www.monkeyandcrow.com