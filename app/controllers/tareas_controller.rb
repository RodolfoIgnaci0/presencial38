class TareasController < ApplicationController
  before_action :authenticate_user!
  def index
    #muestra todas las tareas del usuario actual conectado
    @tareas = Tarea.joins(accions: :user).where("users.id = ?", current_user.id)
  end
end
