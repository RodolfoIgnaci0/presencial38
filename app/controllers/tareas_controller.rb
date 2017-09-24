class TareasController < ApplicationController
  before_action :authenticate_user!

  def show
    @tarea = Tarea.find(params[:id])
  end

  def index
    # muestra todas las tareas del usuario actual conectado
    # @tareas = Tarea.joins(accions: :user).where("users.id = ?", current_user.id)

    @intento = User.joins(:tareas, :accions)
                   .select('tareas.nombre, tareas.descripcion, tareas.photo, accions.hecho')
                   .distinct.where("users.id = ?", current_user.id)

    # lista total de tareas
    @listaTotal = Accion.where('user_id = ?', current_user.id).count
    # lista tareas completas
    @listaCompletos = Accion.where(user_id: current_user.id, hecho: true).count
  end

  def update
    @done = Accion.find(true)
    respond_to do |format|
      if @done.update(tarea_params)
        format.html { redirect_to @done, notice: 'Tarea was successfully updated.' }
        format.json { render :show, status: :ok, location: @done }
      else
        format.html { render :edit }
        format.json { render json: @done.errors, status: :unprocessable_entity }
      end
    end
  end


  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def tarea_params
    params.require(:accion).permit(:hecho)
  end
end
