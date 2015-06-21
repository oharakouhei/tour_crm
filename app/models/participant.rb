# == Schema Information
#
# Table name: participants
#
#  id         :integer          not null, primary key
#  name       :string
#  course_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Participant < ActiveRecord::Base
  # courseとの関係は？
  belongs_to :course
  validates :name, presence: true, length: { maximum: 20 }
end
