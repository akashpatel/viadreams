class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :title
      t.text :description
      t.string :author
      t.integer :likes

      t.timestamps
    end
  end
end
