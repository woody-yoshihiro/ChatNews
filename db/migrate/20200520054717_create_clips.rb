class CreateClips < ActiveRecord::Migration[5.2]
  def change
    create_table :clips do |t|
      t.string :url
      t.string :title
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
