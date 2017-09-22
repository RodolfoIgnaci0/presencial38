class Accion < ApplicationRecord
  belongs_to :user
  belongs_to :tarea
end
