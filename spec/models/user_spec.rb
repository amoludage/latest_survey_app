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
    @user = FactoryGirl.create(:user, :gender) #:name => 'Rails')
    #@user1 = FactoryGirl.build_list(:user, 20)
  end

  it 'has nil name then invalid'do
    @user.name = ''
    expect(@user).not_to be_valid
  end

  it 'has nil email then invalid'do
    @user.email = ''
    expect(@user).not_to be_valid
  end

  it 'has nil password then invalid'do
    user = User.create(name: 'rahul jagdale', email: 'rahul21@gmail.com')
    user.password = ''
    expect(user).not_to be_valid
  end

  it 'has password valid length'do
    user = User.create(name: 'rahul jagdale', email: 'rahul21@gmail.com')
    user.password = 'amoludage11'
    expect(user).to be_valid
  end

  it 'has name'do
    @user.name = 'rahul patil'
    expect(@user).to be_valid
  end

  it 'name has min length of 3 char'do
    @user.name = 'ab'
    expect(@user).not_to be_valid
  end

  it 'email has min length 8 characters'do
    @user.email = 'a@g.in'
    expect(@user).not_to be_valid
  end

  it 'ckeck has valid email'do
    @user.email = 'ac@go.in'
    expect(@user).to be_valid
  end

  it 'check has invalid email'do
    @user.email = '#amol@gmail.com'
    expect(@user).not_to be_valid
  end

  it 'has unique email'do
    @duplicate_email = @user.dup
    @duplicate_email.save
    expect(@duplicate_email).not_to be_valid
  end

  it 'has age invalid value'do
    @user.age = 'abc'
    expect(@user).not_to be_valid
  end

  it 'has age numeric valid value'do
    @user.age = 33
    expect(@user).to be_valid
  end

  it 'has age above 15'do
    @user.age = 14
    expect(@user).not_to be_valid
  end

  it 'has age below 70'do
    @user.age = 77
    expect(@user).not_to be_valid
  end

  it 'gender'do
  end
  it 'has role'
  it 'validate role'
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
