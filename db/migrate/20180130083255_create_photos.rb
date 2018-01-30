class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.references :project, foreign_key: true
      t.integer :height
      t.integer :width
      t.string :data

      t.timestamps
    end
  end
end
