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
#

class Target < ApplicationRecord
    has_many :events
end
