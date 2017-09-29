class AccionsController < ApplicationController
  def update
    @task = Tarea.find(params[:tarea_id])
    @action = @task.accions.find(params[:id])
    @task_completed = Accion.joins(:tareas, :users).where('current_user = ? and tareas.id = ?', @user.id, @tarea.id).update(hecho: true)
    @task_incompleted = Accion.joins(:tareas, :users).where('current_user = ? and tareas.id = ?', @user.id, @tarea.id).update(hecho: false)
    # Accion.where('user_id = 6 and tarea_id = 32').update(hecho:true) -> funcional en rails console
  end

  def create
    @tarea = Tarea.find(params[:tarea_id])
    @accion = Accion.create(tarea: @tarea, user: current_user, hecho:true)
    if @accion.save
      redirect_to root_path, notice: 'Se guardo'
    else
      redirect_to root_path, notice: 'No se guardo'
    end
  end

  def destroy
    tarea = Tarea.find(params[:tarea_id])
    asociacion = tarea.accions.find(params[:id])
    tarea.accions.delete(asociacion)
    redirect_to root_path
  end
end
