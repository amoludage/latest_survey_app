require 'rails_helper'

RSpec.describe SurveysController, :type => :controller do

  describe 'GET #index'do
    it 'render the index view'do
      #survey = FactoryGirl.create(:survey)
      get :index
      expect(response.status).to eq(302)
    end
  end

  describe 'GET #new'do
    it 'render new template'do
      #survey = FactoryGirl.create(:survey)
      get :new
      expect(response.status).to eq(302)
    end
  end

  describe 'POST #create'do
    it'creates new survey'do
      survey = FactoryGirl.build(:survey)
      post :create
      expect(response.status).to eq(302)
    end
  end
end
