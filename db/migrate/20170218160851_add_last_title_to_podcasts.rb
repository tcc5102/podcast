class AddLastTitleToPodcasts < ActiveRecord::Migration[5.0]
  def change
    add_column :podcasts, :last_title, :string
  end
end
