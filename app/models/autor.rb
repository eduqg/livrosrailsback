class Autor < ApplicationRecord
    validates :nome, :email, :password, presence: true
end
