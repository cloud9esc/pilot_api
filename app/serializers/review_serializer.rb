class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :content, :has_spoiler, :created_at, :updated_at
  has_many :comments
end
