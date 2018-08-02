class LessonsController < ApplicationController
  def create; end

  def index
    lessons = Lesson.order(:created_at)
    render json: lessons
  end

  def show
    lesson = Lesson.find(params[:id])
    render json: lesson
  end

  def update; end

  def destroy
    lesson= Lesson.find(params[:id])
    lesson.destroy
    #envoie une response vide (204)
    head :no_content
  end
end
