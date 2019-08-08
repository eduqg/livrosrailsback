class Livro < ApplicationRecord
  belongs_to :autor
  validates :titulo, :preco, presence: true
end
