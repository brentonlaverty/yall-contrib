class CreatePrompts < ActiveRecord::Migration
  def change
    create_table :prompts do |t|
      t.string :headline
      t.text :body
      t.string :image_url
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
