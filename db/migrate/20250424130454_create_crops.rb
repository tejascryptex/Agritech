class CreateCrops < ActiveRecord::Migration[8.0]
  def change
    create_table :crops do |t|
      t.string :name
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
