class RoutinesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_routine, only: [:show, :edit, :pre_destroy]
  
  def index
    if current_user.nil?
      redirect_to new_user_session_path
    else  
      @routines = Routine.all.limit(6)
    end  
  end

  def show
    
  end
  
  def new
    @routine = Routine.new
  end

  def create
    @routine = Routine.new(routine_params)
    @routine.student_id = current_user.student.id
  
    if @routine.save
      flash[:notice] = "Rotina criada com sucesso."
      redirect_to routines_path(@routine)
    else
      logger.error @routine.errors.full_messages
      flash[:error] = @routine.errors.full_messages.join(", ")
      render :new
    end
  end
  
  def edit
    
  end

  def update
    #debugger
    @routine = Routine.find(params[:id])
    if @routine.update(routine_params)
        flash[:notice] = "Rotina atualizada com sucesso."
        redirect_to routines_path(@routine)
    else
        render :edit
    end  
  end

  def pre_destroy
    if @routine
      #debugger
      render 'pre_destroy_routine'
    else
      flash[:error] = 'Veículo não encontrado.'
      render 'index'
    end  
  end
  
  def destroy
    #debugger
    @routine = Routine.find_by(id: params[:id])
    
    if @routine
      if @routine.destroy
        flash[:notice] = 'Rotina excluída com sucesso.'
      else
        flash[:error] = 'Erro ao excluir a Rotina.'
      end
    else
      flash[:error] = 'Rotina não encontrada.'
    end
    redirect_to routines_path
  end

  private

  def set_routine
    if params[:id] == "pre_delete"
      # Lógica para tratamento especial de pré-exclusão
      # Por exemplo, você pode definir uma variável de instância @routine com um objeto fictício
      @routine = Routine.new
      @routine.id = -1
      @routine.day_of_the_week = "Segunda-feira"
      @routine.hour = "10:00"
      @routine.activity = "Atividade de exemplo"
      @routine.priority = 1
    else
      @routine = Routine.find(params[:id])
    end
  end

  def routine_params
    params.require(:routine).permit(:day_of_the_week, :hour, :activity, :priority)
  end
end