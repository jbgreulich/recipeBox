class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :source
      t.string :description
      t.string :yield
      t.string :cooktime
      t.string :ingredients, array: true, default: []
      t.string :instructions, array: true, default: []

      t.timestamps
    end
  end
end
