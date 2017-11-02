class AddColumnToVideos < ActiveRecord::Migration[5.1]
  def change
    add_column :videos, :description, :string
  end
end
