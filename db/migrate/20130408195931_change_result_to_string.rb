class ChangeResultToString < ActiveRecord::Migration
  def change
  	remove_column :results, :result
  	add_column :results, :result, :string
  end
end
