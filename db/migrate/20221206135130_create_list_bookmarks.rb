class CreateListBookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :list_bookmarks do |t|
      t.text :comment
      t.references :list, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
