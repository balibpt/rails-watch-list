class ChangePosterUrlInMovies < ActiveRecord::Migration[7.0]
  def change
    change_column :movies, :poster_url, :string, null: true
  end
end
