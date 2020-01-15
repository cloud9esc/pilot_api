class Review < ApplicationRecord
  # model association
  has_many :comments, dependent: :destroy

  # validations
  validates_presence_of :title, :author
end
