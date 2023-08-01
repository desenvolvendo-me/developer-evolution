class CoursesController < ApplicationController


  def show
    @course = Course.find(params[:id])
  end
  def new
    @course = Course.new
  end
  def create
    @course = Course.new(course_params)
    @course.student = current_user.student

    if @course.save
      redirect_to @course, notice: t('controller.flash_create')
    else
      puts @course.errors.full_messages
      flash.now[:alert] = t('controller.flash_create_error')
      render :new
    end
  end
  def edit
    @course = Course.find(params[:id])
  end
  def update
    @course = Course.find(params[:id])
    @course.update(course_params) ? redirect_to(@course, notice: t('controller.flash_update')) : render(:edit)
  end

  def index
    @courses = current_user.courses
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    flash[:notice] = t('controller.flash_destroy')
    redirect_to courses_path
  end


  private

    def course_params
      params.require(:course).permit(:type_course)
    end

    def student
      current_user.student
    end

end
