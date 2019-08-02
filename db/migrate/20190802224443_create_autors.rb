class CreateAutors < ActiveRecord::Migration[5.2]
  def change
    create_table :autors do |t|
      t.string :nome
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
