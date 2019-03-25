class CreateGifs < ActiveRecord::Migration[5.2]
  def change
    create_table :gifs do |t|
      t.string :url
      t.string :title

      t.timestamps
    end
  end
end
