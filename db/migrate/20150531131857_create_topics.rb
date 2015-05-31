class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.text :body
      t.references :user, index: true, foreign_key: true
      t.boolean :finished_flg
      t.references :page, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
