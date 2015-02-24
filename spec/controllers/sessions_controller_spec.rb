require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  describe "GET new" do
    it "render the sessions new template" do
      #user = FactoryGirl.create(:user)
      get :new
      expect(response.status).to render_template(:new)
    end
  end

  describe "POST create" do
    it "returns http success status if login success " do
      #user = FactoryGirl.create(:user)
      post :create, :user => {:email => 'amoludage@josh.com', :password => 'amoludage1'}
      expect(response).to have_http_status(:success)
    end

    it 'return if login failed'do
      #user = FactoryGirl.create(:user)
      post :create, :user => {:email => 'amoludage@josh.com', :password => 'amoludage'}
      expect(response.status).to render_template(:new)
    end
  end

  describe "GET destroy" do
    it "returns http success" do
      user = FactoryGirl.create(:user)
      get :destroy
      expect(response).to have_http_status(302)
    end
  end

end
