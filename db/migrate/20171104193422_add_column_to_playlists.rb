class AddColumnToPlaylists < ActiveRecord::Migration[5.1]
  def change
    add_column :playlists, :yt_id, :string
  end
end
