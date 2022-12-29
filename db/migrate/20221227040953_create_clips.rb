class CreateClips < ActiveRecord::Migration[7.0]
  def change
    create_table :clips do |t|
      t.string :url
      t.string :filename
      t.string :type
      t.string :name
      t.text   :description

      t.text :og_images, array: true, default: []
      t.string :og_title

      t.timestamp :expires

      t.timestamps
    end
  end
end
