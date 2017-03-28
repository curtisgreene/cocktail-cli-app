class CreateDrinksTable < ActiveRecord::Migration[5.0]
  def change
    create_table :drinks do |t|
      t.string :name
      t.text :instructions
      t.string :glass_type
    end
  end
end
