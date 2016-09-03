class CreateQuotations < ActiveRecord::Migration[5.0]
  def change
    create_table :quotations do |t|
      t.string :quote
      t.string :author
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
