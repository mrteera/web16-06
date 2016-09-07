class CreateQuotations < ActiveRecord::Migration[5.0]
  def change
    create_table :quotations do |t|
      t.text :quote
      t.string :author_name
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
