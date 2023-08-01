class Courses::CourseBasicsController < ApplicationController
  before_action :set_course
  before_action :set_course_basic, only: %i[show edit update destroy]

  def show
    @course_basic = @course.course_basics.find(params[:id])
  end
  def index
    @course = Course.find(params[:course_id])
    @course_basics = @course.course_basics
  end

  def new
    @course_basic = @course.course_basics.build
  end

  def create
    # @message = Message.new(message_params)
    @course_basic = @course.course_basics.build(course_basic_params)

    respond_to do |format|
      if @course_basic.save
        format.html { redirect_to [@course, @course_basic], notice: "Message was successfully created." }
        format.json { render :show, status: :created, location: @course_basic }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end
  def update
    redirect_to @course_basic.update(course_basic_params) ? [@course, @course_basic] : edit_course_course_basic_path(@course, @course_basic), notice: @course_basic.update(course_basic_params) ? t('controller.flash_update') : t('controller.flash_fail_purpose')
  end

  def destroy
    @course_basic.destroy
    redirect_to [@course, :course_basics], notice: t('controller.flash_destroy')
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_course_basic
    @course_basic = @course.course_basics.find(params[:id])
  end

  def course_basic_params
    params.require(:course_basic).permit(:link_course, :link_repository, :link_certified, :avaliation_course, :avaliation_apprenticeship)
  end
end
