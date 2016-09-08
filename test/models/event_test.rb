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
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
