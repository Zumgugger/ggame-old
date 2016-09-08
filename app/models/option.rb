# == Schema Information
#
# Table name: options
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  count      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Option < ApplicationRecord
    has_many :events
end
