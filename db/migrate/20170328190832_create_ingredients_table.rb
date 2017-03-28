class CreateIngredientsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.string :id_string
      t.string :name
    end
  end
end
