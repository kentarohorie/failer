class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.date :post_date
      t.text :content
      t.references :user, index: true

      t.timestamps
    end
  end
end
