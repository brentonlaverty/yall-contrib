class CreateContribs < ActiveRecord::Migration
  def change
    create_table :contribs do |t|
      t.string :headline
      t.text :body
      t.string :image_url
      t.boolean :is_published, default: false

      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
