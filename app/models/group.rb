# == Schema Information
#
# Table name: groups
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  points            :integer          default(0)
#  member1           :string(255)
#  member2           :string(255)
#  member3           :string(255)
#  member4           :string(255)
#  natel1            :string(255)
#  natel2            :string(255)
#  natel3            :string(255)
#  natel4            :string(255)
#  false_information :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  kopfgeld          :integer          default(0)
#  sort_order        :integer
#

class Group < ApplicationRecord
has_many :events
    
    
    def self.import(file)
      require 'roo'
      spreadsheet =  open_spreadsheet(file)
      header = spreadsheet.row(1)
      sort = 1
      (2..spreadsheet.last_row).each do |r|
        row = Hash[[header, spreadsheet.row(r)].transpose]
        group = find_by_id(row["id"]) || new
        group.attributes = row.to_hash.slice("name", "member1", "member2", "member3", "member4", "natel1", "natel2", "natel3", "natel4", "sort_order")
        group.save!
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
