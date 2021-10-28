class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      add_column :products, :url, :string

      t.timestamps
    end
  end
end
