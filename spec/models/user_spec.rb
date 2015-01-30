require 'rails_helper'

RSpec.describe User, :type => :model do
=begin
  fixtures :users
  before(:each)do
  @user = users(:user1)
end
=end
#let(:user){users(:user1)}

  before(:each)do
    @user = FactoryGirl.build(:user, :gender) #:name => 'Rails')
    #@user1 = FactoryGirl.build_list(:user, 20)
  end


  it 'has role'
  it 'validate role'

  it 'has name'do
    puts @user.inspect
    #puts @user1.inspect
  end

  it 'validate name'do
    User.new(:name => '').should_not be_valid
  end

  it 'name must be string'
  it 'has email'
  it 'has password'
  it 'has valid email and password'
  it 'has invalid email/password then re-enter'
  it 'is participated in survey '
  it 'has number of questions'
  it 'has to be fill all details about himself'
  it 'has one option for one question'
  it 'has to be covered all the questions'
  it 'has to be complete the survey process'
  it 'has to submit survey application response'
  it 'get the feedback from admin'
end
