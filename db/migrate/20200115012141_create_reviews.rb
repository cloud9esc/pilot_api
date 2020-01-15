class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :author
      t.boolean :has_spoiler
      t.integer :category_id
      t.text :content
      t.string :img_url
      t.string :deleted_by

      t.timestamps
    end
  end
end
