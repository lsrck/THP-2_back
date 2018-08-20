class LessonsController < ApplicationController
  def create
    lesson = Lesson.create!(create_params)
    if lesson.errors.empty?
      render json: lesson
    else
      render json: { errors: lesson.errors }, status: :forbidden
    end
  end

  def index
    lessons = Lesson.order(:created_at)
    render json: lessons
  end

  def show
    lesson = Lesson.find(params[:id])
    render json: lesson
  end

  def update
    lesson = Lesson.find(params[:id])
    lesson.update(update_params)
    if lesson.errors.empty?
      render json: lesson
    else
      render json: { errors: lesson.errors }, status: :forbidden
    end
  end

  def destroy
    lesson = Lesson.find(params[:id])
    lesson.destroy
    # envoie une response vide (204)
    head :no_content
  end

  private

  def create_params
    params.permit(:title, :description)
  end

  def update_params
    params.permit(:title, :description)
  end
end
