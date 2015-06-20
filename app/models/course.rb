class Course < ActiveRecord::Base
  # participantとの関係は？
  has_many :participants
  validates :guide_name,
    presence: { message: 'は必須です' },
    length: { maximum: 20, message: '%{value}は%{count}文字以下でなければなりません' }
end
