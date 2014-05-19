class NutrientDb
  DATA_DIR = File.dirname(__FILE__) + "/../data/sr26/"
  
  META_DATA = {
    "food_des" => {
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
    
    "nut_data" => {
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
      max_value:         :num,  # Max
      degrees_of_freedom: :int, # DF
      lower_error_bound: :num,  # Low_EB
      upper_error_bound: :num,  # Up_EB
      stat_comments:     :text, # Stat_cmt
      updated_at:        :date, # AddMod_Date
      confidence_id:     :text, # CC
    },
    
    "nutr_def" => {
      id:                :text, # Nutr_No
      units:             :text, # Units
      tag_name:          :text, # Tagname
      name:              :text, # NutrDesc
      decimals:          :int,  # Num_Dec
      sort_order:        :int,  # SR_Order
    },
    
    "langual" => {
      food_id:           :text, # NDB_No
      factor_id:         :text, # Factor_Code
    },
    
    "langdesc" => {
      id:                :text, # Factor_Code
      name:              :text, # Description
    },
    
    "fd_group" => {
      id:                :text, # FdGrp_Cd
      name:              :text, # FdGrp_Desc
    },
    
    "src_cd" => {
      id:                :text, # Src_Cd
      name:              :text, # SrcCd_Desc
    },
    
    "deriv_cd" => {
      id:                :text, # Deriv_Cd
      name:              :text, # Deriv_Desc
    },
    
    "datasrcln" => {
      food_id:           :text, # NDB_No
      nutrient_id:       :text, # Nutr_No
      data_source_id:    :text, # DataSrc_ID
    },
    
    "data_src" => {
      id:                :text, # DataSrc_ID 
      authors:           :text, # Authors
      title:             :text, # Title
      year:              :int,  # Year 
      journal:           :text, # Journal
      volume_or_city:    :text, # Vol_City
      state:             :text, # Issue_State
      start_page:        :text, # Start_Page 
      end_page:          :text, # End_Page
    },
    
    "footnote" => {
      food_id:           :text, # NDB_No
      id:                :text, # Footnt_No
      type:              :text, # Footnt_Typ (D: Description, M: Measure, N: nutrient)
      nutrient_id:       :text, # Nutr_No
      footnote:          :text, # Footnt_Txt
    },
    
    "weight" => {
      food_id:           :text, # NDB_No 
      sort_order:        :int,  # Seq 
      amount:            :text, # Amount - Unit modifier (for example, 1 in “1 cup”).
      type:              :text, # Msre_Desc - Description (for example, cup, diced, and 1-inch pieces).
      grams:             :num, # Gm_Wgt 
      data_points:       :int, # Num_Data_Pts 
      std_dev:           :num, # Std_Dev
    },
  }
  
  attr_reader :data_dir
  
  def initialize(data_dir=DATA_DIR)
    @data_dir = data_dir
    @cache    = {}
  end
  
  def [] name
    name = normalize_file_name(name)
    path = data_path(name)
    
    columns = META_DATA.fetch(name)
    
    Parser.new(path, columns)
  end
  
  private
  
  def normalize_file_name(file_name)
    File.basename(file_name.downcase)
  end
  
  def data_path(file_name)
    File.join(data_dir, file_name + ".txt")
  end
  
  def method_missing name, *arguments
    name = name.to_s
    
    if META_DATA.key? name
      self[name]
    else
      super
    end
  end
  
end

require_relative './nutrient_db/parser'