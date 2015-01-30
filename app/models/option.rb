class Option < ActiveRecord::Base

  has_many :responses
  has_many :users, through: :responses

  #validates_presence_of :question_id
  validates_length_of :description, :in => 2..20
  #validates :question_id, presence: true
  #validates :description, length: {minimum: 2, maximum: 20}
end
