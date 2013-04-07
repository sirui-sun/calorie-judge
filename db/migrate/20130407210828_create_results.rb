class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :name
      t.string :gender
      t.integer :age
      t.integer :result

      t.timestamps
    end
  end
end
