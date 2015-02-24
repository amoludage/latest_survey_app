class Role < ActiveRecord::Base

  has_many :users
  validates_inclusion_of :name, :in => %w(admin user), :message => "name is not valid"
  #validates :name, inclusion: {in: %w(admin user), message: "Invalid role"}
end
