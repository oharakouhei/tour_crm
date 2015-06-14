class Participant < ActiveRecord::Base
  # courseとの関係は？
  belongs_to :course
end
