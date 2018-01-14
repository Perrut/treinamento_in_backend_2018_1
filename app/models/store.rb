class Store < ApplicationRecord
  # validação no campo address para um registro na tabela stores
  # o parâmetro não pode ser vazio e deve possuir um mínimo de 10
  # e um máximo de 100 caracteres
  validates :address, presence: true, length: { in: 10..100 }
  # validação no campo telephone para um registro na tabela stores
  # o parâmetro não pode ser vazio, deve ser numérico
  # e possuir exatamente 8 caracteres
  validates :telephone, presence: true, numericality: { only_integer: true },
    length: { minimum: 8, maximum: 8 }
end
