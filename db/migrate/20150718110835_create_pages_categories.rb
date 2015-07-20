class CreatePagesCategories < ActiveRecord::Migration
  def change
    create_table :pages_categories do |t|
      t.references :page, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
