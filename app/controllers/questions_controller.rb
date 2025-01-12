# frozen_string_literal: true

class QuestionsController < ApplicationController
  include QuestionsAnswers
  before_action :require_authentication, except: %i[show index]
  before_action :set_question, only: %i[show edit update destroy]
  before_action :authorize_question!
  after_action :verify_authorized

  def index
    @pagy, @questions = pagy Question.all_by_tags(params[:tag_ids])
    @questions = @questions.decorate
  end

  def show
    load_questions_answers
  end

  def new
    @question = Question.new
  end

  def edit; end

  def create
    @question = current_user.questions.build question_params
    if @question.save
      flash[:success] = 'Question successfully created!'
      redirect_to questions_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @question.update question_params
      flash[:success] = 'Question successfully updated'
      redirect_to questions_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @question.destroy
    flash[:success] = t('.success')
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, tag_ids: [])
  end

  def set_question
    @question = Question.find params[:id]
  end

  def authorize_question!
    authorize(@question || Question)
  end
end
