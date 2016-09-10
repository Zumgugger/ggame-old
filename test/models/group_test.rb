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

require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
