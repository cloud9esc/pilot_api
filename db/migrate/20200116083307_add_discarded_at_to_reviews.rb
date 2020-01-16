class AddDiscardedAtToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :discarded_at, :datetime
    add_index :reviews, :discarded_at
    remove_column :reviews, :deleted_by
  end
end
