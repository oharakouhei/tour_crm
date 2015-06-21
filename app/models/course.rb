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

class Course < ActiveRecord::Base
  # participantとの関係は？
  has_many :participants
  validates :guide_name,
    presence: { message: 'は必須です' },
    length: { maximum: 20, message: '%{value}は%{count}文字以下でなければなりません' }
end
