# frozen_string_literal: true

class AnswersController < ApplicationController
  include QuestionsAnswers
  include ActionView::RecordIdentifier

  before_action :set_question!
  before_action :set_answer!, except: [:create]
  before_action :authorize_answer!
  after_action :verify_authorized

  def edit; end

  def create
    @answer = @question.answers.build(answer_create_params)

    if @answer.save
      flash[:success] = 'Answer created!'
      redirect_to question_path(@question)
    else
      load_questions_answers(do_render: true)
    end
  end

  def update
    if @answer.update(answer_update_params)
      flash[:success] = 'Answer updated!'
      redirect_to question_path(@question, anchor: dom_id(@answer))
    else
      render 'questions/show'
    end
  end

  def destroy
    @answer.destroy
    flash[:success] = 'Answer deleted!'
    redirect_to question_path(@question)
  end

  private

  def answer_create_params
    params.require(:answer).permit(:body).merge(user_id: current_user.id)
  end

  def answer_update_params
    params.require(:answer).permit(:body)
  end

  def set_question!
    @question = Question.find params[:question_id]
  end

  def set_answer!
    @answer = @question.answers.find params[:id]
  end

  def authorize_answer!
    authorize(@answer || Answer)
  end
end
