class SurveysController < ApplicationController
  def index
    @survey = Survey.all
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      flash[:notice] = "survey successfully saved"
      redirect_to root_path
    else
      flash[:error] = 'something went wrong in form: please fill all detail'
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
      redirect_to root_path
    else
      flash[:error] = 'Something wrong: please insert all detail properly'
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
end
