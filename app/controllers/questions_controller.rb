class QuestionsController < ApplicationController
    def create
    @user = User.find(params[:user_id])
    @question = @user.questions.new(question_params)
    if @question.save
      flash[:notice] = "Question added!"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @questions = Question.find(params[:user_id])
  end

  def new
    @user = User.find(params[:user_id])
    @question = Question.new
  end

  def create
    @user = User.find(params[:user_id])
    @question = @user.questions.new(question_params)
    if @question.save
      flash[:notice] = "Question added successfully!"
      redirect_to user_path(@user)
    else
      render :new
    end

  end

  def index
    @user = User.find(params[:user_id])
  end

  def destroy
    @user = User.find(params[:user_id])
    @question = Question.find(params[:id])
    if @question.destroy
      flash[:alert] = "Question successfully deleted!"
    end
    redirect_to :back
  end

  private
  def question_params
    params.require(:question).permit(:title, :body)
  end
end
