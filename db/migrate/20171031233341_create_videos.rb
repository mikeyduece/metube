class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :etag
      t.string :videoId
      t.string :img_default
      t.string :img_high
      t.string :title
      t.string :published_at

      t.timestamps
    end
  end
end
