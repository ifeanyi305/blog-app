class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.references :author, null: false, foreign_key: { to_table: 'users'}, index: true
      t.references :post, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
