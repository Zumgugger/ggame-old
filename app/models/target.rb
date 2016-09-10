# == Schema Information
#
# Table name: targets
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  points      :integer
#  mines       :integer          default(0)
#  count       :integer          default(0)
#  last_action :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  village     :string(255)
#  sort_order  :integer
#

class Target < ApplicationRecord
    has_many :events
    
    def self.import(file)
      require 'roo'
      spreadsheet =  open_spreadsheet(file)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |r|
        row = Hash[[header, spreadsheet.row(r)].transpose]
        target = find_by_id(row["id"]) || new
        target.attributes = row.to_hash.slice("name", "village", "description", "points", "sort_order")
        target.last_action = Time.now
        target.save!
      end
    end
    
    def self.open_spreadsheet(file)
      case File.extname(file.original_filename)
      when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
      when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, packed: nil, file_warning: :ignore)
      else raise "Unknown file type: #{file.original_filename}"
      end
    end
    
    
    
    
    
    
    
end
