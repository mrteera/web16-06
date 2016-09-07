class CreateAllquotations < ActiveRecord::Migration[5.0]
  def change
    create_table :allquotations do |t|
      t.string :quote
      t.string :author
      t.references :categories, foreign_key: true

      t.timestamps
    end
  end
end
