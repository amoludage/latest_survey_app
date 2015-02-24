class User < ActiveRecord::Base

  belongs_to :role

  has_many :responses
  has_many :options, through: :responses

  validates :name, length: {minimum: 3}
  #validates_length_of :name, :in => 3..25
  validates_format_of :name, :with => /\A[a-zA-Z\s\z]+/ , :message => "only contain characters"

  #validates_presence_of :gender  # not null
  validates_inclusion_of :gender, in: %w(Male Female), :allow_nil => true, message: "%{value} is not valid gender"
  GENDER = ['Male', 'Female']
  #validates_presence_of :age
  #validates :age, length: { minimum: 2}
  #validates :age, numericality: {only_integer: true}
  validates_numericality_of :age, :allow_nil => true, :greater_than => 15, :less_than_or_equal_to => 70, :only_integer => true


  validates :email, length: {minimum: 8}, uniqueness: true
  #validates_length_of :email, :in => 5..25
  validates_format_of :email, :with => /\A([^@\s#*-]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, :message => " invalid email"

  validates :password, length: {minimum: 7}
  #validates_length_of :password, :in => 8..25
  #validates :role_id, presence: true
  has_secure_password

  before_save :change_name
  def change_name
    puts 'user name in downcase'
    self.name = name.downcase.titleize
  end

  before_save do
    puts 'email'
    self.email = email.downcase
  end
=begin
  def sample(input)
    return true if input.between?(1,9)
    return false
  end
=end
end
