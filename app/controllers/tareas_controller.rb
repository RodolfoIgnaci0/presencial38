class TareasController < ApplicationController
  before_action :authenticate_user!
  before_action :listaTareas
  before_action :find_tarea, only: [:show]

  def show
    @users_completed = User.joins(:tareas, :accions)
                           .select('users.email, tareas.nombre')
                           .distinct.where("accions.hecho = true and tareas.id = ?", @tarea.id)

    @ranking = User.joins(:tareas, :accions)
                   .select('users.avatar, users.email, tareas.nombre, accions.created_at')
                   .distinct.where("accions.hecho = true and tareas.id = ?", @tarea.id)
                   .order('created_at ASC').limit(5)
  end

  def index
    # muestra todas las tareas del usuario actual conectado
    # @tareas = Tarea.joins(accions: :user).where("users.id = ?", current_user.id)
    @all = Tarea.all
    @intento = User.joins(:tareas, :accions)
                   .select('tareas.id, tareas.nombre, tareas.descripcion, tareas.photo, accions.tarea_id, accions.hecho')
                   .distinct.where("users.id = ?", current_user.id)
  end


  private
   def find_tarea
     @tarea = Tarea.find(params[:id])
   end
   def listaTareas
     # lista total de tareas
     @listaTotal = Tarea.count
     # lista tareas completas
     @listaCompletos = Accion.where(user_id: current_user.id, hecho: true).count
   end
end
