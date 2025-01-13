# frozen_string_literal: true

class CommentsController < ApplicationController
  include QuestionsAnswers
  before_action :set_commentable!
  before_action :set_question
  after_action :verify_authorized

  def create
    @comment = @commentable.comments.build comment_params
    authorize @comment
    @comment = @comment.decorate

    if @comment.save
      respond_to do |format|
        format.html do
          flash[:success] = t('.success')
          redirect_to question_path(@question)
        end

        format.turbo_stream do
          flash[:success] = t('.success')
        end
      end
    else
      load_questions_answers do_render: true
    end
  end

  def destroy
    @comment = @commentable.comments.find params[:id]
    authorize @comment

    @comment.destroy
    respond_to do |format|
      format.html do
        flash[:success] = t('.success')
        redirect_to question_path(@question)
      end

      format.turbo_stream do
        flash.now[:success] = t('.success')
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user: current_user)
  end

  def set_commentable!
    klass = [Question, Answer].detect { |c| params["#{c.name.underscore}_id"] }
    raise ActiveRecord::RecordNotFound if klass.blank?

    @commentable = klass.find(params["#{klass.name.underscore}_id"])
  end

  def set_question
    @question = @commentable.is_a?(Question) ? @commentable : @commentable.question
  end
end
