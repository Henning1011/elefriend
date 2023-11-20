class CreatePets < ActiveRecord::Migration[7.1]
  def change
    create_table :pets do |t|
      t.string :pet_name
      t.text :title
      t.text :description
      t.float :price
      t.string :category
      t.string :species
      t.text :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
