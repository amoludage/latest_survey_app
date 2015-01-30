class User < ActiveRecord::Base

  belongs_to :role

  has_many :responses
  has_many :options, through: :responses

  validates_length_of :name, :in => 6..15
  validates_format_of :name, :with => /\w+/ , :message => "only contain characters"

  #validates_presence_of :gender  # not null
  validates_inclusion_of :gender, in: %w(M F), :allow_nil => true, message: "%{value} is not valid gender"

  #validates_presence_of :age
  #validates :age, length: { minimum: 2}
  #validates :age, numericality: {only_integer: true}
  validates_numericality_of :age, :allow_nil => true, :greater_than => 15, :less_than_or_equal_to => 90, :only_integer => true


  #validates :email, length: {minimum: 5, maximum: 30}
  validates_length_of :email, :in => 8..25
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, :message => " invalid email"

  #validates :password, length: {minimum: 8, maximum: 15}
  validates_length_of :password, :in => 8..20
  #validates :role_id, presence: true

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
