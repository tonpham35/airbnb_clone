class User < ApplicationRecord
  attr_accessor :profilepic
  include Clearance::User

  mount_uploader :profilepic, ImageUploader
  
  paginates_per 10

	validates :email, presence: {message: "Please fill-in all fields" }
	validates :email, uniqueness: { message: "must be new"}
	validates :email, format: { with: /\w*@.*\.\w*/, message: "Invalid email address" } 
	validates :password, length: { minimum: 6, message: "Password must be at least 6 characters" }, on: :create

	has_many :listings, dependent: :destroy
	has_many :reservations, dependent: :destroy
	has_many :authentications, :dependent => :destroy

  enum access_level: [:customer, :moderator, :superadmin]

  def self.create_with_auth_and_hash(authentication, auth_hash)
      user = User.create!(first_name: auth_hash["name"], email: auth_hash["extra"]["raw_info"]["email"], password: SecureRandom.hex(5))
      user.authentications << (authentication)      
      return user
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

  # def password_optional?
  #   true
  # end
end

