class TareasController < ApplicationController
  before_action :authenticate_user!
  def index
    #muestra todas las tareas del usuario actual conectado
    @tareas = Tarea.joins(accions: :user).where("users.id = ?", current_user.id)
    #completar tareas
    @hecho = Accion.joins(:tarea, :user).where("users.id = ?", current_user.id)

    # listado de tareas
      # lista total de tareas
       @listaTotal = Accion.where('user_id = ?', current_user.id).count
       # lista tareas completas
       @listaCompletos = Accion.where(('user_id = current_user.id') && ('hecho = true')).count
  end
end
