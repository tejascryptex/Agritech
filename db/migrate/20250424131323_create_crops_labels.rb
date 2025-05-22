class CreateCropsLabels < ActiveRecord::Migration[8.0]
  def change
    create_table :crops_labels do |t|
      t.references :crop, null: false, foreign_key: true
      t.references :crop_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
