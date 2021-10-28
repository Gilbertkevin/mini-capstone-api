class UrLtoImagesTable < ActiveRecord::Migration[6.1]
  def change
    add_column :images, :url, :string

    remove_column :products, :url
  end
end
