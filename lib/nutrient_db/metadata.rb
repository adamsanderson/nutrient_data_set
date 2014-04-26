require 'yaml'

class NutrientDb::Metadata
  
  def [] file_name
    key = normalize_file_name(file_name)
    META_DATA.fetch key
  end
  
  private
  
  def normalize_file_name(file_name)
    File.basename(file_name.downcase)
  end
  
  META_DATA = {
    "food_des.txt" => {
      id:                :text, # NDB_No
      food_group_id:     :text, # FdGrp_Cd
      description:       :text, # Long_Desc
      short_description: :text, # Shrt_Desc
      common_name:       :text, # ComName
      manufacturer_name: :text, # ManufacName
      is_complete:       :bool, # Survey
      refuse:            :text, # Ref_desc
      percent_refuse:    :int,  # Refuse
      scientific_name:   :text, # SciName
      nitrogen_factor:   :num,  # N_Factor
      protein_factor:    :num,  # Pro_Factor
      fat_factor:        :num,  # Fat_Factor
      calorie_factor:    :num,  # CHO_Factor
    },
    
    "nut_data.txt" => {
      food_id:           :text, # NDB_No 
      nutrient_id:       :text, # Nutr_No 
      value:             :num,  # Nutr_Val 
      samples:           :int,  # Num_Data_Pts
      std_error:         :num,  # Std_Error
      source_id:         :text, # Src_Cd 
      derivation_id:     :text, # Deriv_Cd
      reference_food_id: :text, # Ref_NDB_No
      is_fortification:  :bool, # Add_Nutr_Mark
      num_studies:       :int,  # Num_Studies
      min_value:         :num,  # Min
      max_value:         :max,  # Max
      degrees_of_freedom: :int, # DF
      lower_error_bound: :num,  # Low_EB
      upper_error_bound: :num,  # Up_EB
      stat_comments:     :text, # Stat_cmt
      updated_at:        :date, # AddMod_Date
      confidence_id:     :text, # CC
    },
    
    "nutr_def.txt" => {
      id:                :text, # Nutr_No
      units:             :text, # Units
      tag_name:          :text, # Tagname
      name:              :text, # NutrDesc
      decimals:          :int,  # Num_Dec
      sort_order:        :int,  # SR_Order
    },
    
    "langual.txt" => {
      food_id:           :text, # NDB_No
      factor_id:         :text, # Factor_Code
    },
    
    "langdesc.txt" => {
      id:                :text, # Factor_Code
      name:              :text, # Description
    }
  }
end