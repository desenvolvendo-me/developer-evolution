class ScriptsController < ApplicationController
  before_action :set_script, only: [:show, :edit, :update, :destroy]

  def index
    @scripts = current_user.student.scripts
  end

  def show
  end

  def new
    @script = Script.new
  end

  def create
    @script = current_user.student.scripts.build(script_params)
    if @script.save
      redirect_to @script, notice: 'Script was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @script.update(script_params)
      redirect_to @script, notice: 'Script was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @script.destroy
    redirect_to scripts_url, notice: 'Script was successfully destroyed.'
  end

  private

  def set_script
    @script = Script.find(params[:id])
  end

  def script_params
    params.require(:script).permit(:category)
  end
end
