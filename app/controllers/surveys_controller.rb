class SurveysController < ApplicationController
  before_filter :is_user_login?

  def index
    @survey = Survey.all
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      flash[:notice] = "survey successfully saved"
      redirect_to surveys_path
    else
      flash[:error] = 'please fill all detail'
      render 'new'
    end
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def new
    @survey = Survey.new
    #4.times do
     # @survey.questions.build
    #end
  end

  def show
    @survey = Survey.find(params[:id])
    #q = @survey.questions.build
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update_attributes(survey_params)
      flash[:notice] = 'survey updated successfully'
      redirect_to surveys_path
    else
      flash[:error] = 'please insert all detail properly'
      render 'edit'
    end
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    flash[:notice] = 'Survey deleted'
    redirect_to surveys_path
  end

  private
  def survey_params
    params.require(:survey).permit(:name, :survey_type, :conducted_on, :count_people)# questions_attributes: [:description])
  end

  def is_user_login?
    if !session[:user_id]
      flash[:error] = 'Please Login first for survey app'
      redirect_to root_path
    end
  end
end
