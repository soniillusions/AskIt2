# frozen_string_literal: true

class RemoveDefaultUserIdFromQuestionsAnswers < ActiveRecord::Migration[7.1]
  def change
    return unless User.any?

    change_column_default :questions, :user_id, from: User.first.id, to: nil
    change_column_default :answers, :user_id, from: User.first.id, to: nil
  end
end
