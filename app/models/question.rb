class Question < ActiveRecord::Base

  has_many :options
  belongs_to :survey
  accepts_nested_attributes_for :options
  validates_length_of :description, :in => 5..100
  #validates :description, length: {minimum: 5, maximum: 100}
  # validates_presence_of :survey_id
  # validates :survey_id, presence: true
  #before_save :put, if: :survey_id
  after_create :update_question_count, if: :survey_id
  accepts_nested_attributes_for :options

  def update_question_count
    puts "In update question"
    qcount = self.survey.questions.count
    puts qcount
    self.survey.update_attribute(:question_count, qcount)
  end

  #def put
   # puts 'before save'
  #end
end
