class AddDayToPodcasts < ActiveRecord::Migration[5.0]
  def change
    add_column :podcasts, :days, :string
  end
end
