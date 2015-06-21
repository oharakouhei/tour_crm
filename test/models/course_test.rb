# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  tour_date   :date
#  guide_name  :string
#  title       :string
#  description :text
#  lower_limit :integer
#  upper_limit :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
