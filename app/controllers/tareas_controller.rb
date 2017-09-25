class TareasController < ApplicationController
  before_action :authenticate_user!
  before_action :find_tarea, only: [:show]

  def show
  end

  def index
    # muestra todas las tareas del usuario actual conectado
    # @tareas = Tarea.joins(accions: :user).where("users.id = ?", current_user.id)

    @intento = User.joins(:tareas, :accions)
                   .select('tareas.id, tareas.nombre, tareas.descripcion, tareas.photo, accions.hecho')
                   .distinct.where("users.id = ?", current_user.id)

    # lista total de tareas
    @listaTotal = Accion.where('user_id = ?', current_user.id).count
    # lista tareas completas
    @listaCompletos = Accion.where(user_id: current_user.id, hecho: true).count
  end

  private
   def find_tarea
      @tarea = Tarea.find(params[:id])
   end
end
