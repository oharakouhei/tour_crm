class Participant < ActiveRecord::Base
  # courseとの関係は？
  belongs_to :course
  validates :name, presence: true, length: { maximum: 20 }
end
