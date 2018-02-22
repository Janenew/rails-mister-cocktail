class AddImageUrlToCoktails < ActiveRecord::Migration[5.1]
  def change
    add_column :cocktails, :image_url, :string
  end
end
