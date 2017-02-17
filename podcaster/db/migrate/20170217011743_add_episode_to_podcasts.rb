class AddEpisodeToPodcasts < ActiveRecord::Migration[5.0]
  def change
    add_column :podcasts, :episode, :integer
  end
end
