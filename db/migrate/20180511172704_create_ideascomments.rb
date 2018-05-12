class CreateIdeascomments < ActiveRecord::Migration[5.1]
  def change
    create_table :ideascomments do |t|
      t.text :body
      t.references :idea, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
