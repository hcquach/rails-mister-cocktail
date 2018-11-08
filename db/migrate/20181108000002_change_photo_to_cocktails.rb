class ChangePhotoToCocktails < ActiveRecord::Migration[5.2]
  def change
    change_column :cocktails, :photo, :string, :default => 'image/upload/v1541698477/vykexa17bmmjkyz48c8t.png'
  end
end
