class TareasController < ApplicationController
  before_action :authenticate_user!
  def index
    @tareas = Tarea.all
  end
end
