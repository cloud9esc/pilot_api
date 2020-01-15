class DeleteCategoryIdColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :category_id
  end
end
