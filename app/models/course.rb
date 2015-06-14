class Course < ActiveRecord::Base
  # participantとの関係は？
  has_many :participants
end
