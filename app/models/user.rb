# email:string
# password_digest:string
# password:string virtual
# password_confirmation:string virtual

class User < ApplicationRecord
  has_secure_password
  has_many :entries, dependent: :destroy
  
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
  before_save :capitalize_name
  def capitalize_name
    self.name = self.name.capitalize
    self.level = 0
  end
end

