class ChangeColumnNameOnFavorites < ActiveRecord::Migration[5.1]
  def change
    rename_column :favorites, :videos_id, :video_id
  end
end
