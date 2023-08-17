class RoutinesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_routine, only: [:show]

  def index
    if current_user.nil?
      redirect_to new_user_session_path
    else
      @routines = Routine.all.limit(6)
    end
  end

  def show;
  end

  def new
    @routine = Routine.new
  end

  def create
    @routine = Routine.new(routine_params)
    @routine.student_id = current_user.student.id

    if @routine.save
      flash[:notice] = t('controller.routine.create.notice')
      redirect_to routines_path(@routine)
    else
      logger.error @routine.errors.full_messages
      flash[:error] = @routine.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @routine = Routine.find(params[:id])
  end

  def update
    @routine = Routine.find(params[:id])
    if @routine.update(routine_params)
      flash[:notice] = t('controller.routine.update.notice')
      redirect_to routines_path(@routine)
    else
      render :edit
    end
  end

  def destroy
    @routine = Routine.find_by(id: params[:id])

    if @routine
      if @routine.destroy
        flash[:notice] = t('controller.routine.destroy.notice_deleted')
      else
        flash[:error] = t('controller.routine.destroy.notice_error')
      end
    end
    redirect_to routines_path
  end


  private

  def set_routine
    @routine = current_user.student.routines.find_by(id: params[:id])
  end

  def routine_params
    params.require(:routine).permit(:day_of_the_week, :hour, :activity, :priority, :student_id)
  end
end