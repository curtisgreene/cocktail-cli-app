class AddPortionColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :drink_ingredients, :portion, :string
  end
end
