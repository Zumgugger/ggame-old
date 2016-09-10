# == Schema Information
#
# Table name: groups
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  points            :integer
#  member1           :string(255)
#  member2           :string(255)
#  member3           :string(255)
#  member4           :string(255)
#  natel1            :integer
#  natel2            :integer
#  natel3            :integer
#  natel4            :integer
#  false_information :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  kopfgeld          :integer          default(0)
#

class Group < ApplicationRecord
has_many :events
end
