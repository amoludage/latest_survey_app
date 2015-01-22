class User < ActiveRecord::Base
  belongs_to :role

  has_many :responses
  has_many :options, through: :responses

end
