class ChangeColumnNameOnVideos < ActiveRecord::Migration[5.1]
  def change
    rename_column :videos, :videoId, :video_id
  end
end
