class CreateCropCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :crop_categories do |t|
      t.string :category_name
      t.string :growing_condition

      t.timestamps
    end
  end
end
