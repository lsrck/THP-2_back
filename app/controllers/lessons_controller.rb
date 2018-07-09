class LessonsController < ApplicationController
  def create
  end

  def index
  end

  def show
    lesson = Lesson.find(params[:id])
    render json: lesson
  end

  def update
  end

  def destroy
  end
end
