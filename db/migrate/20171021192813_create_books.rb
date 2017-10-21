class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :edition_year
      t.string :language
      t.text :description

      t.timestamps
    end
  end
end
