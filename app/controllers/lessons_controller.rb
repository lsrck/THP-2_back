class LessonsController < ApplicationController
  def create
    lesson = Lesson.create(params[:id])
  end

  def index
    lessons = Lesson.order(:created_at)
    render json: lessons
  end

  def show
    lesson = Lesson.find(params[:id])
    render json: lesson
  end

  def update; end

  def destroy; end
end
