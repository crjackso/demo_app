class Participant < ActiveRecord::Base
  belongs_to :microsite, :foreign_key => :microsite_id
  accepts_nested_attributes_for :microsite

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :country_code, presence: true
  validates :email, presence: true, email: true

  validates_uniqueness_of :email, scope: :microsite_id

  before_save { self.email = email.downcase }


end
