class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :overview
      t.string :poster_url
      t.float :rating, null: false, default: 0.0

      t.timestamps
    end
  end
end
