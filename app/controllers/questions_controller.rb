class QuestionsController < ApplicationController
  def index
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions
  end

  def show
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions
  end

  def new
    @survey  = Survey.find(params[:survey_id])
    @question = @survey.questions.build
    4.times do
      @question.options.build
    end
  end

  def create
    @survey  = Survey.find(params[:survey_id])
    @question = @survey.questions.new(question_params)
    if @question.save
      flash[:notice] = 'question created successfully'
      redirect_to survey_questions_path(@survey)
    else
      flash[:error] = 'something went wrong'
      render 'new'
    end
  end

  def edit
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.find(params[:id])
  end

  def update
    @survey  = Survey.find(params[:survey_id])
    @question = @survey.questions.find(params[:id])
    if @question.update_attributes(question_params)
      flash[:notice] = 'Question update successfully'
      redirect_to survey_questions_path(@survey)
    else
      flash[:error] = 'something is wrong'
      render 'edit'
    end
  end

  def destroy
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.find(params[:id])
    @question.destroy
    redirect_to survey_questions_path(@survey)
  end

  private
  def question_params
    params.require(:question).permit(:description, options_attributes: [:id, :description])
  end
end
