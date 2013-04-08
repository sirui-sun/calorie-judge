class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.integer :number
      t.string :name
      t.integer :calorie
      t.string :serving_size
      t.string :company
      t.string :source
      t.string :tags

      t.timestamps
    end
  end
end
