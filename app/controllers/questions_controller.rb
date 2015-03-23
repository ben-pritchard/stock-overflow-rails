class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      flash[:notice] = "Question added successfully!"
      redirect_to questions_path
    else
      render :new
    end
  end

    def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "Question successfully edited!"
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      flash[:alert] = "Question successfully deleted!"
    end
    redirect_to :back
  end

  private
  def question_params
    params.require(:question).permit(:title, :body, :user_id)
  end
end
