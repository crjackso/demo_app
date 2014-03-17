class Participant < ActiveRecord::Base
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :country_code, presence: true
  validates :email, uniqueness: { case_sensitive: false }, :email => true

  before_save { self.email = email.downcase }
end
