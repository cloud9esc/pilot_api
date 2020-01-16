class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :category_id, :title, :author, :img_url, :content, :has_spoiler, :created_at, :updated_at
  has_many :comments
end
