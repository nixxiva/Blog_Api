class CreateArticles < ActiveRecord::Migration[7.2]
  def change
    create_table :articles do |t|
      t.string :article_number
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
