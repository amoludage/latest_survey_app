class Response < ActiveRecord::Base

  belongs_to :user
  belongs_to :option

  validates_uniqueness_of :user, :scope => :option
 # validates :user, uniqueness: { scope: :option }
end
