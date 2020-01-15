class AddAssociationToCategory < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :category, index: true
  end
end
