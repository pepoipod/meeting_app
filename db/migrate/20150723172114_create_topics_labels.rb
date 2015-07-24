class CreateTopicsLabels < ActiveRecord::Migration
  def change
    create_table :topics_labels do |t|
      t.references :topic, index: true, foreign_key: true
      t.references :label, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
