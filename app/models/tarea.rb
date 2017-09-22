class Tarea < ApplicationRecord
  has_many :accions
  has_many :users, through: :accions
end
