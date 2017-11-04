class RenameColumnOnPlaylists < ActiveRecord::Migration[5.1]
  def change
    rename_column :playlists, :yt_id, :yt
  end
end
