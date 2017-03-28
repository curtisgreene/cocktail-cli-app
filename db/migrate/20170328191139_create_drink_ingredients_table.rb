class CreateDrinkIngredientsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :drink_ingredients do |t|
      t.string :drink_id_string
      t.string :ingredient_id_string
    end
  end
end
