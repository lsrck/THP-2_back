class LessonsController < ApplicationController
  def create
    lessons = Lessons.order(created_at)
    render json: lessons
  end

  def index; end

  def show
    lesson = Lesson.find(params[:id])
    render json: lesson
  end

  def update; end

  def destroy; end
end
