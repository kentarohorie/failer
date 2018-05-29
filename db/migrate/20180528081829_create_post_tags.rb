class CreatePostTags < ActiveRecord::Migration[5.2]
  def change
    create_table :post_tags do |t|
      t.references :post, index: true
      t.references :tag, index: true
      t.timestamps
    end
  end
end
