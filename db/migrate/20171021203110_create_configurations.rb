class CreateConfigurations < ActiveRecord::Migration[5.1]
  def change
    create_table :configurations do |t|
      t.string :label, null: false

      t.timestamps
    end
  end
end
