class Survey < ActiveRecord::Base

  has_many :questions
  TYPES = ['General', 'Educational']
  #validates :name, length: {minimum: 4, maximum: 15}
  validates_length_of :name, :in => 4..15
  validates_length_of :survey_type, :in => 4..15
  validates_numericality_of :count_people, :allow_nil => true, :only_integer => true

  #validates :count_people, numericality: {only_integer: true}
  #validates_inclusion_of :conducted_on, :in => Date.civil(2013, 01, 01)..Date.today
  validates_inclusion_of :conducted_on , :in =>  Date.civil(2000-01-01)..Date.today, message: "%{value} is not valid date"
  #accepts_nested_attributes_for :questions
end

