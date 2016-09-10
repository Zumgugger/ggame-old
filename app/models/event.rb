# == Schema Information
#
# Table name: events
#
#  id                  :integer          not null, primary key
#  time                :datetime
#  group_id            :integer
#  noticed             :boolean
#  points_set          :integer
#  target_id           :integer
#  description         :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  target_group_id     :integer
#  group_points        :integer
#  target_points       :integer
#  target_group_points :integer
#  option_id           :integer
#

class Event < ApplicationRecord
  belongs_to 	:group
	
  belongs_to 	:option

  belongs_to	:target_group, optional: true,
		:class_name => 'Group'

  belongs_to	:target, optional: true
    
  accepts_nested_attributes_for :target, :group

end
