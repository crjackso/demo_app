class Microsite < ActiveRecord::Base
  has_many :participants
  validates :name, presence: true, uniqueness: true

end
