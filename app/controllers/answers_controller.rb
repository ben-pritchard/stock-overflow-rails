class AnswersController < ApplicationController
  def new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    if @answer.save
      flash[:notice] = "Answer added successfully! Might not be right but at least it's there."
      redirect_to :back
    else
      render :new
    end
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.upvote
    if @answer.save
      redirect_to question_path(@question)
    else
      redirect_to :back
    end
  end

private
  def answer_params
    params.require(:answer).permit(:body, :votes)
  end

end
