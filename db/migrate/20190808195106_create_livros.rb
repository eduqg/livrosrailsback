class CreateLivros < ActiveRecord::Migration[5.2]
  def change
    create_table :livros do |t|
      t.string :titulo
      t.float :preco
      t.references :autor, foreign_key: true

      t.timestamps
    end
  end
end
