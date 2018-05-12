class CreateScrapscomments < ActiveRecord::Migration[5.1]
  def change
    create_table :scrapscomments do |t|
      t.text :body
      t.references :scrap, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
