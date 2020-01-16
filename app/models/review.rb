class Review < ApplicationRecord
  # model association
  has_many :comments, dependent: :destroy
  belongs_to :category
  # validations
  validates_presence_of :title, :author
  include Discard::Model
end
