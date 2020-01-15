class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.string :content
      t.references :review, null: false, foreign_key: true
      t.string :password
      t.timestamps
    end
  end
end
