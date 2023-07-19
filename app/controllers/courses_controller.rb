class CoursesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def lesson
  end
end
