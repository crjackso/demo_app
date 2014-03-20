class Participant < ActiveRecord::Base
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :country_code, presence: true
  validates :email, uniqueness: { case_sensitive: false }, :email => true

  validates_uniqueness_of :email, scope: :microsite_id

  before_save { self.email = email.downcase }

  belongs_to :microsite
  accepts_nested_attributes_for :microsite
end
