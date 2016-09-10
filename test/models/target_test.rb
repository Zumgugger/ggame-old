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

require 'test_helper'

class TargetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
