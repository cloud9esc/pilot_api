class Comment < ApplicationRecord
  belongs_to :review
  # validation
  validates_presence_of :commenter
end
