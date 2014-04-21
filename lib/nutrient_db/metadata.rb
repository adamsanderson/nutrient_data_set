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
      is_complete:       :text, # Survey
      refuse:            :text, # Ref_desc
      percent_refuse:    :int,  # Refuse
      scientific_name:   :text, # SciName
      nitrogen_factor:   :num,  # N_Factor
      protein_factor:    :num,  # Pro_Factor
      fat_factor:        :num,  # Fat_Factor
      calorie_factor:    :num,  # CHO_Factor
    }
  }
end