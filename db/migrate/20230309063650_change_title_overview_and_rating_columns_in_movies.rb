class ChangeTitleOverviewAndRatingColumnsInMovies < ActiveRecord::Migration[7.0]
  def change
    change_column :movies, :rating, :integer, null: true
    change_column :movies, :overview, :text, null: true
    change_column :movies, :title, :string, null: true
  end
end
