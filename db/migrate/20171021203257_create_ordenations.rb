class CreateOrdenations < ActiveRecord::Migration[5.1]
  def change
    create_table :ordenations do |t|
      t.string :field, null: false
      t.string :direction
      t.references :configuration, foreign_key: true

      t.timestamps
    end
  end
end
