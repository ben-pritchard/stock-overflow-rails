class AnswersController < ApplicationController::Base
  def new

  end

  def create
    @question = Question.find(params[:id])
    @answer = @question.answers.new(answer_id)
    if @question.answers
  end

private

end
