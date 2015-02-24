require 'rails_helper'

RSpec.describe RegistrationsController, :type => :controller do

  describe 'GET #new'do
    it 'render new views'do
      get :new
      #user = FactoryGirl.create(:user)
      expect(response.status).to render_template(:new)
    end
  end

  describe 'POST #create'do
    it 'if valid information create the user'do
      #user = FactoryGirl.create(:user)
      post :create, :user => {:name => "vishal jagdale", :email => "vishal@gmail.com", :password => "vishal123", :password_confirmation => "vishal123"}
      expect(response).to have_http_status(302)
    end

    it 'if invalid information then render new'do
      #user = FactoryGirl.create(:user)
      post :create, :user => {:name => 'vikas', :email => 'vikas', :password => 'vikas123', :password_confirmation => 'vikas123' }
      expect(response.status).to render_template(:new)
    end
  end
end
